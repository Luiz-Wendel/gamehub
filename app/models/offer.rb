class Offer < ActiveRecord::Base
  # Enums (see helper)
  enum status: {:waiting_response => 0, :accepted => 1, :refused => 2}
  
  #Associations
  belongs_to :member
  belongs_to :exchange
  belongs_to :sale
  belongs_to :member_game
  
  #Scopes
  scope :recieved_exchanges, ->(member) { where("exchange_id <> ''").joins(:exchange).where('exchanges.member' => member) }
  scope :recieved_sales, ->(member) { where("sale_id <> ''").joins(:sale).where('sales.member' => member) }
  scope :performed_exchanges, ->(member) { where(member: member).where("exchange_id <> ''") }
  scope :performed_sales, ->(member) { where(member: member).where("sale_id <> ''") }
end
