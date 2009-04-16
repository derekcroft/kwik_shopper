class Item < ActiveRecord::Base
  belongs_to :category
  belongs_to :aisle
  has_and_belongs_to_many :carts

  validates_presence_of :category

  def self.new_from_usda_food(uf)
    Item.new do |i|
      i.name = uf.search_terms
      i.description = uf.long_desc
      i.unit_of_measure = uf.gmwt_desc1
      i.category = Category.new_or_existing(uf.usda_food_group.name)
      i.save!
    end
  end
end
