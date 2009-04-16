class Category < ActiveRecord::Base
  has_many :items

  validates_presence_of :name
  validates_uniqueness_of :name

  def self.new_or_existing(name)
    Category.find_by_name(name) || Category.create({ :name => name, :description => name })
  end
end
