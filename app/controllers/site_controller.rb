class SiteController < ApplicationController
  include AuthenticatedSystem

  skip_before_filter :verify_authenticity_token, :only => [:auto_complete_for_item_name]
  auto_complete_for :item, :name

  def index
   
  end
end
