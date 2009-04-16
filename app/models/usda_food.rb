class UsdaFood < ActiveRecord::Base
  belongs_to :usda_food_group

  self.csv_easily_block = lambda { |f, row|
    f.usda_food_group = UsdaFoodGroup.find_by_fdgrp_cd(row["fdgrp_cd"])
    f.search_terms = row["long_desc"].split(',')[0]
  }
end
