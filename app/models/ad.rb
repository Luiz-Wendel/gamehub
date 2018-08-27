class Ad < ActiveRecord::Base
  belongs_to :category
  belongs_to :member

  validates_presence_of :titles
end
