class Ad < ActiveRecord::Base
  # Constantes
  QTT_PER_PAGE = 6
  
  #Callbacks
  before_save :md_to_html

  # Associations
  belongs_to :category, counter_cache: true
  belongs_to :member
  has_many :comments

  # Validates
  validates :title, :description_md, :description_short, :category, :finish_date, :picture, presence: true
  validates :price, numericality: { greater_than: 0 }

  # Scope
  scope :descending_order, ->(page) { order(created_at: :desc).page(page).per(QTT_PER_PAGE) } # Pega cinco anúnicos ordenados de forma descendente conforme a data de criação
  scope :to_member, ->(member) { where(member: member) } # Pega os anúncios de um membro
  scope :by_category, ->(id, page) { where(category: id).page(page).per(QTT_PER_PAGE) } # Pega os anúncios de um membro
  scope :search, ->(term, page) { where("lower(title) LIKE ?", "%#{term.downcase}%").page(page).per(QTT_PER_PAGE) } # Procura os anúncio com o título passado como parâmetro
  scope :random, ->(quantity) {Ad.limit(quantity).order("RANDOM()") } # Seleciona anúncios randomicamente

  # Configuração da gem 'paperclip'
  has_attached_file :picture, styles: { large: "900x350#", medium: "254x150#", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  # Configuração da gem 'money-rails'
  monetize :price_cents
  
  # Configuração da gem ratyrate
  ratyrate_rateable 'quality' # Adiciona uma avaliação para os anúncios

  private
    # Método para transformar Markdown em HTML
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
