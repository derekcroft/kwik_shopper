class Item < ActiveRecord::Base
  belongs_to :category
  belongs_to :aisle
  has_and_belongs_to_many :carts

  validates_presence_of :category
  validates_uniqueness_of :name

  def self.new_or_existing(usda_food)
    Item.find_by_name(usda_food.search_terms) ||
      Item.create({ :name => usda_food.search_terms,
        :description => usda_food.long_desc,
        :unit_of_measure => usda_food.gmwt_desc1,
        :category => Category.new_or_existing(usda_food.usda_food_group.name)})
  end
end
