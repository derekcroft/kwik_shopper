namespace :db do
  namespace :data do
    namespace :import do
      desc "Import from Kroger CSV"
      task :kroger => :environment do
        FasterCSV.foreach("#{RAILS_ROOT}/db/kroger_scs_feed.csv", :headers => :first_row) do |row|
          # find or create the store for this item
          store = Store.find_by_name(row["Store"]) || Store.create({ :name => row["Store"] })
          aisle = store.aisles.find_by_number(row["Aisle"]) || store.aisles.create({ :number => row["Aisle"]})

          # create the category
          category = Category.find_by_name(row["Category"]) || Category.create({ :name => row["Category"] })

          # create the item
          Item.create( { :name => row["Product Name"], :price => row["Price"],
              :category => category, :aisle => aisle } )
        end
      end

      desc "Import USDA foods and food groups"
      task :usda => :environment do
        puts "Loading usda_food_groups table..."
        UsdaFoodGroup.transaction do
          UsdaFoodGroup.destroy_all
          FasterCSV.foreach("#{RAILS_ROOT}/db/usda_food_groups.csv", :headers => :first_row) do |row|
            UsdaFoodGroup.create( :name => row["fdgrp_desc"], :fdgrp_cd => row["fdgrp_cd"] )
          end
        end

        puts "Loading usda_foods table..."
        UsdaFood.transaction do
          UsdaFood.delete_all
          FasterCSV.foreach("#{RAILS_ROOT}/db/usda_foods.csv", :headers => :first_row) do |row|
            UsdaFood.create do |uf|
              #ndb_number fdgrp_cd long_desc short_desc name comname manufacname ref_desc gmwt_1 gmwt_desc1 gmwat_2 gmwt_desc2
              uf.attributes = row.to_hash
              uf.usda_food_group = UsdaFoodGroup.find_by_fdgrp_cd(row["fdgrp_cd"])
            end
          end
        end
      end
    end
  end
end
