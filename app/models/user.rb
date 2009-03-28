class User < ActiveRecord::Base
  has_many :carts
end
