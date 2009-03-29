class CreateAisles < ActiveRecord::Migration
  def self.up
    create_table :aisles do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :aisles
  end
end
