class CreateAisles < ActiveRecord::Migration
  def self.up
    create_table :aisles do |t|
      t.string :name, :description
      t.integer :number
      t.integer :store_id
      t.string :comment
      t.timestamps
    end
  end

  def self.down
    drop_table :aisles
  end
end
