When(/^I click on the Explore the catalogue button$/) do
  home_page.hero_cta.click
  TestEvolve.browser.h1(text: "Explore the catalogue").wait_until(&:exists?)
end

Then(/^I see a top-level heading saying "Welcome to the Parkinson's UK Tech Guide"$/) do
  raise 'Home page hero missing its heading' unless home_page.hero_title.visible?
  raise 'Home page hero has wrong text' unless home_page.hero_title.text == "Welcome to the Parkinson’s UK Tech Guide"
end

Then(/^I see the home-page hero text block$/) do
  raise 'Home-page hero text is missing' unless home_page.hero_text.visible?
end

Then(/^I see the hero image$/) do
  raise 'Home-page hero image is missing' unless home_page.hero_image.visible?
end

Then(/^I see the Explore the catalogue button$/) do
  raise 'Home-page hero CTA button is missing' unless home_page.hero_cta.visible?
end

Then(/^I am taken to the product display page$/) do
  raise 'Expecting to be on the PDP but the URL is wrong' unless TestEvolve.browser.url == CATALOGUE_URL
end

Then(/^there is a second-level heading saying "The Tech Guide helps you to..."$/) do
  text = "The Tech Guide helps you to..."
  raise 'Benefits heading is not present' unless home_page.heading2(text).present?
end

Then(/^there is a second-level heading saying "What’s new"$/) do
  text = "What’s new"
  raise "What’s new heading is not present" unless home_page.heading2(text).present?
end

Then(/^there is a third-level heading saying "Discover"$/) do
  text = "Discover"
  raise "Benefits subheading '#{text}' is not present" unless home_page.subheading(text).present?
end

Then(/^there is a third-level heading saying "Understand"$/) do
  text = "Understand"
  raise "Benefits subheading '#{text}' is not present" unless home_page.subheading(text).present?
end

Then(/^there is a third-level heading saying "Trust"$/) do
  text = "Trust"
  raise "Benefits subheading '#{text}' is not present" unless home_page.subheading(text).present?
end

Then(/^there is a third-level heading saying "Recent reviews"$/) do
  text = "Recent reviews"
  raise "Subheading '#{text}' is not present" unless home_page.subheading(text).present?
end

Then(/^there is a third-level heading saying "New products"$/) do
  text = "New products"
  raise "Subheading '#{text}' is not present" unless home_page.subheading(text).present?
end

Then(/^there is a text block starting "New technology arrives all the time"$/) do
  text = "New technology arrives all the time"
  raise "Benefits text block starting '#{text}' is not present" unless home_page.text_block(text).present?
end

Then(/^there is a text block starting "Knowing what's out there is only part of the answer"$/) do
  text = "Knowing what’s out there is only part of the answer"
  raise "Benefits text block starting '#{text}' is not present" unless home_page.text_block(text).present?
end

Then(/^there is a text block starting "Our trusted reviews help you decide"$/) do
  text = "Our trusted reviews help you decide"
  raise "Benefits text block starting '#{text}' is not present" unless home_page.text_block(text).present?
end

Then(/^there are three cards containing the most recently published reviews in reverse chronological order$/) do
  raise "Latest-product list doesn't include two items" unless home_page.latest_review_list.size == 2
  raise "No actual latest-product cards" unless home_page.latest_review_card.present?
end

Then(/^each card includes the product name, a product image, the price-band indicator and a "Read review" button$/) do
  raise "Latest-product card does not have the product name" unless home_page.latest_review_card.h4(data_cy: "product-name").present?
  raise "Latest-product card does not have an image" unless home_page.latest_review_card.img(data_cy: "product-image").present?
  raise "Latest-product card does not have a price range" unless home_page.latest_review_card.span(data_cy: "price-range").present?
  raise "Latest-product card does not have a CTA button" unless home_page.latest_review_card.a(data_cy: "product-info-link").present?
end

Then(/^there is a horizontal list of five product names$/) do
  raise "Latest products list is missing" unless home_page.latest_product_list.present?
  raise "Latest products list doesn't have 5 items" unless home_page.latest_product_list.size == 5
end
