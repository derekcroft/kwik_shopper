class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :name, :description
      t.integer :category_id, :aisle_id
      t.float :price
      t.string :unit_of_measure
      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
