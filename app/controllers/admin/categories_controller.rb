class Admin::CategoriesController < ApplicationController
  layout "admin"
  active_scaffold :category
end
