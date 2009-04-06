class Admin::StoresController < ApplicationController
  layout "admin"
  active_scaffold :store
end
