class CartItem < ActiveRecord::Migration
  def self.up
 create_table :carts_items do |t|
  t.integer :item_id
  t.integer :cart_id 
  end
end

  def self.down
   drop_table :carts_items
  end
end
