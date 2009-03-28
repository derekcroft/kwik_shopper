class CreateAisles < ActiveRecord::Migration
  def self.up
    create_table :aisles do |t|
    t.integer :number
    t.integer :store_id
    t.string :description
    t.string :comment
      t.timestamps
    end
  end

  def self.down
    drop_table :aisles
  end
end
