Given(/^I am on the product page for Parkinson's ON$/) do
  @parkinsons_on_page = product_page(product_name: 'parkinsons-on')
  @parkinsons_on_page.visit
  @parkinsons_on_page.wait_for_page_load
end

Then(/^the product page passes an accessibility audit$/) do
  @parkinsons_on_page.scan_for_accessibility
end

Then(/^the page heading is 'Parkinson’s ON'$/) do
  raise "Page heading is #{@parkinsons_on_page.page_heading.text}" unless @parkinsons_on_page.page_heading.text == 'Parkinson’s ON'
end

Then(/^there is a Back button$/) do
  raise 'Back button is missing' unless @parkinsons_on_page.back_button.visible?
end

Then(/^there are breadcrumbs$/) do
  raise 'Breadcrumb "Home" is missing' unless @parkinsons_on_page.breadcrumbs.first.text == 'Home' and @parkinsons_on_page.breadcrumbs.first.a.href == TestEvolve.environment['root_url']
  raise 'Breadcrumb "Catalogue" is missing' unless @parkinsons_on_page.breadcrumbs[1].text == 'Catalogue' and @parkinsons_on_page.breadcrumbs[1].a.href == catalogue_page.url
  raise 'Breadcrumb "Parkinson’s ON" is missing' unless @parkinsons_on_page.breadcrumbs[2].text == 'Parkinson’s ON' #No link on final breadcrumb
end

Then(/^the price band tag is 'Free'$/) do
  raise 'Price-band tag is missing' unless @parkinsons_on_page.price_band_tag.visible?
  raise 'Price-band tag has wrong value' unless @parkinsons_on_page.price_band_tag.text == 'Free'
end

Then(/^the company name is 'Parkinson’s ON Ltd'$/) do
  raise "Company name is wrong  (#{company_name})" unless @parkinsons_on_page.company_name == 'Parkinson’s ON Ltd'
end

Then(/^there is a last-updated date$/) do
  raise 'Last-updated date is not visible' unless @parkinsons_on_page.last_updated_date.visible?
end

Then(/^there is a product description$/) do
  raise 'Product description is missing' unless @parkinsons_on_page.product_description.visible?
end

Then(/^there is an image gallery section$/) do
  raise 'Image gallery missing' unless @parkinsons_on_page.image_gallery.visible?
end

Then(/^there is one large product image in the image gallery$/) do
  raise 'No main product image in the gallery' unless @parkinsons_on_page.main_gallery_image.img.visible?
end

Then(/^there are at least two thumbnail images in the image gallery$/) do
  raise 'Thumbnail images are missing from the gallery' unless @parkinsons_on_page.desktop_gallery_thumbnails.count > 1
end

Then(/^there is a Download\/Buy button$/) do
  raise 'The Download/Buy button is missing' unless @parkinsons_on_page.buy_button.visible?
end

Then(/^there is an in-page navbar$/) do
  raise 'In-page navbar is missing' unless @parkinsons_on_page.in_page_navbar.visible?
end

Then(/^there is a Features section$/) do
  raise 'Features section missing from in-page navbar' unless @parkinsons_on_page.in_page_navbar_items.first.text == 'Features'
  @parkinsons_on_page.in_page_navbar_items.first.click
  raise 'Features section heading missing' unless @parkinsons_on_page.features_heading.visible?
end

Then(/^the Features section has at least 5 bullet points$/) do
  raise 'Not enough Features items' unless @parkinsons_on_page.features_items.count > 4
end

Then(/^there is a Categories subsection$/) do
  raise 'Categories area of Features section is missing' unless @parkinsons_on_page.features_categories_subheading.visible?
end

Then(/^there is a category row showing the Product Type as 'App'$/) do
  raise 'Product type row is missing from Categories' unless @parkinsons_on_page.features_categories_first_row_heading == 'Product type'
  raise "'App' entry is missing from Categories (#{@parkinsons_on_page.features_categories_first_row_values.to_s})" unless @parkinsons_on_page.features_categories_first_row_value.text == 'App'
end

Then(/^there is a category row showing the Helps With as including 'Taking my pills'$/) do
  raise "'Helps with' row is missing from Categories (#{@parkinsons_on_page.features_categories_second_row_heading})" unless @parkinsons_on_page.features_categories_second_row_heading == 'Helps with'
  raise '"App" entry is missing from Categories' unless @parkinsons_on_page.features_categories_second_row_values.include?('Taking my pills')
end
