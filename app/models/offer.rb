class Offer < ActiveRecord::Base
  # Constantes
  STTS_ACTV = 0
  
  #Associations
  belongs_to :member
  belongs_to :exchange
  belongs_to :sale
  
  #Scopes
  scope :recieved_exchanges, ->(member) { where("exchange_id <> ''").joins(:exchange).where('exchanges.member' => member) }
  scope :recieved_sales, ->(member) { where("sale_id <> ''").joins(:sale).where('sales.member' => member) }
  scope :performed_exchanges, ->(member) { where(member: member).where("exchange_id <> ''") }
  scope :performed_sales, ->(member) { where(member: member).where("sale_id <> ''") }
  scope :active, ->() { where(status: STTS_ACTV) }
end
