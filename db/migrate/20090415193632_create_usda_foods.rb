class CreateUsdaFoods < ActiveRecord::Migration
  def self.up
    create_table :usda_foods do |t|
      t.integer :usda_food_group_id
      t.integer :ndb_number, :fdgrp_cd
      t.string :name, :long_desc, :short_desc
      t.string :comname, :manufacname, :ref_desc
      t.float :gmwt_1, :gmwat_2
      t.string :gmwt_desc1, :gmwt_desc2
      t.timestamps
    end
  end

  def self.down
    drop_table :usda_foods
  end
end
