module SiteHelper
  def link_to_submit_image
    link_to_function(image_tag("search-submit.png"), nil, :class => "btn") do |page|
      page.hide('getting-started')
      page.insert_html(:bottom, 'shopping-list-content', "<li>Item</li>")
    end
  end
end
