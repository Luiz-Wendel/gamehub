class Ad < ActiveRecord::Base
  #Callbacks
  before_save :md_to_html

  # Associations
  belongs_to :category, counter_cache: true
  belongs_to :member

  # Validates
  validates :title, :description_md, :description_short, :category, :finish_date, :picture, presence: true
  validates :price, numericality: { greater_than: 0 }

  # Scope
  scope :descending_order, ->(quantity = 10) { limit(quantity).order(created_at: :desc) } # Pega cinco anúnicos ordenados de forma descendente conforme a data de criação
  scope :to_member, ->(member) { where(member: member) } # Pega os anúncios de um membro
  scope :by_category, ->(id) { where(category: id) } # Pega os anúncios de um membro

  # Configuração da gem 'paperclip'
  has_attached_file :picture, styles: { large: "800,300#", medium: "254x150#", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  # Configuração da gem 'money-rails'
  monetize :price_cents

  private
    def md_to_html
      options = {
        filter_html: true,
        link_attributes: {
          rel: "nofollow",
          target: "_blank"
        }
      }

      extensions = {
        space_after_headers: true,
        autolink: true
      }

      renderer = Redcarpet::Render::HTML.new(options)
      markdown = Redcarpet::Markdown.new(renderer, extensions)

      self.description = markdown.render(self.description_md)
    end

end
