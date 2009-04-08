module SiteHelper
  def link_to_submit_image
    link_to_function(image_tag("search-submit.png"), 'addItemToShoppingCart()', :class => "btn")
  end
end
