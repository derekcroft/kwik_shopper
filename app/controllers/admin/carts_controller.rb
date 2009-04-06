class Admin::CartsController < ApplicationController
  layout "admin"
  active_scaffold :cart
end
