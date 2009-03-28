class Aisle < ActiveRecord::Base
  belongs_to :store
  has_many :items

  validates_presence_of :store
end
