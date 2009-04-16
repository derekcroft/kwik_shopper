class AddSearchTermsToUsdaFoods < ActiveRecord::Migration
  def self.up
    add_column :usda_foods, :search_terms, :text
  end

  def self.down
    remove_column :usda_foods, :search_terms
  end
end
