class UsdaFood < ActiveRecord::Base
  belongs_to :usda_food_group

  def self.csv_file_name
    csv_directory = "#{RAILS_ROOT}/db"
    "#{csv_directory}/#{self.table_name}.csv"
  end

  def self.from_csv_quickly
    self.transaction do
      self.destroy_all
      FasterCSV.foreach(self.csv_file_name, :headers => :first_row) do |row|
        self.create(row.to_hash) do |f|
          f.usda_food_group = UsdaFoodGroup.find_by_fdgrp_cd(row["fdgrp_cd"])
        end
      end
    end
  end
end
