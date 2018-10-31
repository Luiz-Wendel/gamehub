class Sale < ActiveRecord::Base
  # Constantes
  QTT_PER_PAGE = 9
  
  # Associations
  belongs_to :member
  belongs_to :member_game
  
  # Validates
  validates_presence_of :member_game
  validates :price, numericality: { greater_than: 0 }
  
  #Scopes
  scope :to_member, ->(member) { where(member: member) }
  scope :descending_order, ->(page) { order(created_at: :desc).page(page).per(QTT_PER_PAGE) }
  # .quantity_by_platform: Dá um join na tabela 'member_game' e procura quantos jogos possuem a plataforma passada como parâmetro
  scope :quantity_by_platform, ->(platform) { joins(:member_game).where("member_games.platform = ?", platform).count() }
  scope :where_platform, ->(platform, page) { joins(:member_game).where("member_games.platform = ?", platform).page(page).per(QTT_PER_PAGE) }
  scope :search, ->(term, page) { joins(:member_game => :game).where("lower(games.name) LIKE ?", "%#{term.downcase}%").page(page).per(QTT_PER_PAGE) }
  
  # Configuração da gem 'money-rails'
  monetize :price_cents
  
end
