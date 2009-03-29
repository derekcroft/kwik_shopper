class CreateStores < ActiveRecord::Migration
  def self.up
    create_table :stores do |t|
    t.string :name
    t.integer :geoip
    t.string :address1
    t.string :address2
    t.string :city
    t.string :state
    t.integer :zip
    t.timestamps
    end
  end

  def self.down
    drop_table :stores
  end
end
