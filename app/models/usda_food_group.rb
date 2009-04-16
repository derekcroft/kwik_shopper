class UsdaFoodGroup < ActiveRecord::Base
  include CsvEasily

  has_many :usda_foods
end
