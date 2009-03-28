class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
    t.float :price
    t.integer :category_id
    t.integer :aisle_id
    t.string :description
    t.string :unit_of_measure
      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
