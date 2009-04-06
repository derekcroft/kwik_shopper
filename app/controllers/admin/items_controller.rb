class Admin::ItemsController < ApplicationController
  layout "admin"
  active_scaffold :item
end
