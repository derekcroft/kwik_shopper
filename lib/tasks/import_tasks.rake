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
        UsdaFoodGroup.from_csv_easily

        puts "Loading usda_foods table..."
        UsdaFood.from_csv_easily
      end

      desc "Update Aislewalker data from USDA data"
      task :from_usda => :environment do
        ActiveRecord::Base.transaction do
          Item.delete_all
          Category.delete_all
          UsdaFood.find(:all).each do |uf|
            Item.new_or_existing(uf)
          end
        end
      end
      
    end  # namespace import
  end  # namespace data
end  # namespace db
