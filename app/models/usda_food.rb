class UsdaFood < ActiveRecord::Base
  belongs_to :usda_food_group

  def self.from_csv_quickly
    self.transaction do
      self.destroy_all
      FasterCSV.foreach("#{RAILS_ROOT}/db/usda_foods.csv", :headers => :first_row) do |row|
        self.create(row.to_hash) do |f|
          f.usda_food_group = UsdaFoodGroup.find_by_fdgrp_cd(row["fdgrp_cd"])
        end
      end
    end
  end
end
