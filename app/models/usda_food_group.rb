class UsdaFoodGroup < ActiveRecord::Base
  has_many :usda_foods

  def self.from_csv_quickly
    self.transaction do
      self.destroy_all
      FasterCSV.foreach("#{RAILS_ROOT}/db/usda_food_groups.csv", :headers => :first_row) do |row|
        self.create(row.to_hash)
      end
    end
  end
end
