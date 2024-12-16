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

Then(/^there is a Features section on this product page$/) do
  item = @parkinsons_on_page.in_page_navbar_items.find { |item| item.text == 'Features' }
  raise 'Features section missing from in-page navbar' unless item.present?
  item.click
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
  raise "'App' entry is missing from Categories (#{@parkinsons_on_page.features_categories_first_row_value})" unless @parkinsons_on_page.features_categories_first_row_value == 'App'
end

Then(/^there is a category row showing the Helps With as including 'Taking my pills'$/) do
  raise "'Helps with' row is missing from Categories (#{@parkinsons_on_page.features_categories_second_row_heading})" unless @parkinsons_on_page.features_categories_second_row_heading == 'Helps with'
  raise '"Taking my pills" entry is missing from Categories' unless @parkinsons_on_page.features_categories_second_row_values.find { |item| item.text == 'Taking my pills' }.present?
end

Then(/^there is a Panel review section on this product page$/) do
  item = @parkinsons_on_page.in_page_navbar_items.find { |item| item.text == 'Panel review' }
  raise 'Panel-review section missing from in-page navbar' unless item.present?
  item.click
  raise 'Panel-review section heading missing' unless @parkinsons_on_page.panel_review_heading.visible?
end

Then(/^the panel review on this product page has a 'Quick overview' subheading$/) do
  raise 'Panel-review section missing its overview' unless @parkinsons_on_page.panel_review_subheadings.find { |item| item.text == 'Quick overview' }.present?
end

Then(/^the panel review on this product page has a Highs and Lows box$/) do
  raise 'Highs heading missing from overview' unless @parkinsons_on_page.panel_review_subheadings.find { |item| item.text == 'Highs' }.present?
  raise 'Highs items missing from overview' if @parkinsons_on_page.highs_items.count.zero?
  raise 'Lows heading missing from overview' unless @parkinsons_on_page.panel_review_subheadings.find { |item| item.text == 'Lows' }.present?
  raise 'Lows items missing from overview' if @parkinsons_on_page.lows_items.count.zero?
end

Then(/^the panel review on this product page has a Background section$/) do
  raise 'Background section missing' unless @parkinsons_on_page.panel_review_subheadings.find { |item| item.text == 'Background' }.present?
end

Then(/^the panel review on this product page has a 'Read the full review' link$/) do
  raise '"Read the full review" link missing' unless @parkinsons_on_page.read_full_review_link.present?
  raise '"Read the full review" link wrong' unless @parkinsons_on_page.read_full_review_link == @parkinsons_on_page.url + '/review'
end

Then(/^the panel review on this product page has a 'Read time' value$/) do
  raise 'Reading time is missing' unless @parkinsons_on_page.read_time.present?
  raise "Reading time is wrong ('#{@parkinsons_on_page.read_time}')" unless @parkinsons_on_page.read_time == "Read time: 7mins"
end

Then(/^there is a Community views section on this product page$/) do
  item = @parkinsons_on_page.in_page_navbar_items.find { |item| item.text == 'Community views' }
  raise 'Community-views section missing from in-page navbar' unless item.present?
  item.click
  raise 'Community-views section heading missing' unless @parkinsons_on_page.community_views_heading.visible?
end

Then(/^the Community views section has a log-in link$/) do
  raise 'Share your view button missing' unless @parkinsons_on_page.share_your_view_log_in_link.present?
end

Then(/^the Community views section has a sign-up link$/) do
  raise 'Share your view button missing' unless @parkinsons_on_page.share_your_view_sign_up_link.present?
end

Then(/^there is a 'Learn more' section on this product page$/) do
  item = @parkinsons_on_page.in_page_navbar_items.find { |item| item.text == 'Learn more' }
  raise 'Learn-more section missing from in-page navbar' unless item.present?
  item.click
  raise 'Learn-more section heading missing' unless @parkinsons_on_page.learn_more_heading.visible?
end

Then(/^the 'Learn more' section includes a link to the 'What is an app?' article$/) do
  raise '"What is an app?" article missing' unless @parkinsons_on_page.learn_more_articles.find { |item| item.text == /What is an app?/ }.present?
  raise '"What is an app?" link missing' unless @parkinsons_on_page.learn_more_article_links.find { |item| item.href == '/learn/what-is-an-app-a-beginner-s-guide' }.present?
end

Then(/^the 'Learn more' section includes at least one link to an article in the 'Information and support' section of the main PUK website$/) do
  raise 'No links to the main PUK website' unless @parkinsons_on_page.learn_more_article_links.find { |item| item.href == /https:\/\/www.parkinsons.org.uk\/information-and-support/ }.present?
end

Then(/^there is a 'Questions' section on this product page$/) do
  item = @parkinsons_on_page.in_page_navbar_items.find { |item| item.text == 'Questions' }
  raise 'Questions section missing from in-page navbar' unless item.present?
  item.click
  raise 'Learn-more section heading missing' unless @parkinsons_on_page.questions_heading.visible?
end

Then(/^the first question has the subheading 'Impartiality and transparency'$/) do
  raise 'Impartiality question is missing' unless @parkinsons_on_page.questions_question_names.find { |item| item.text == 'Impartiality and transparency' }.present?
end
