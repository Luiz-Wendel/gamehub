class Comment < ActiveRecord::Base
  belongs_to :member
  belongs_to :exchange
  belongs_to :sale
end
