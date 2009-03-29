class Item < ActiveRecord::Base
  belongs_to :category
  belongs_to :aisle
  has_and_belongs_to_many :carts

  validates_presence_of :category
end
