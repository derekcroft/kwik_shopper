class Cart < ActiveRecord::Base
  has_and_belongs_to_many :items
  belongs_to :user

  validates_presence_of :user
end
