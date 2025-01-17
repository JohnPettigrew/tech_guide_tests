When(/^I click on the Explore the catalogue button$/) do
  home_page.hero_cta.click
  # TestEvolve.browser.h1(text: 'Explore the catalogue').wait_until(&:exists?)
end

When(/^I click on the first card in the Recent reviews section$/) do
  home_page.interesting_product_name = home_page.latest_review_card_name
  home_page.interesting_product_url = home_page.latest_review_card_link
  home_page.latest_review_card.scroll.to :viewport
  raise 'Latest-review cards are not visible' unless home_page.latest_review_card.visible?
  home_page.latest_review_card.click
  # TestEvolve.browser.h1(text: home_page.interesting_product_name).wait_until(&:exists?)
end

When(/^I click on the first card in the New products section$/) do
  home_page.interesting_product_name = home_page.latest_product_card.text
  home_page.interesting_product_url = home_page.latest_product_card.href
  home_page.latest_product_card.scroll.to :viewport
  raise 'Latest-product cards are not visible' unless home_page.latest_product_card.visible?
  home_page.latest_product_card.click
  # TestEvolve.browser.h1(text: home_page.interesting_product_name).wait_until(&:exists?)
end

Then(/^I see a top-level heading saying "Welcome to the Parkinson's UK Tech Guide"$/) do
  raise 'Home page hero missing its heading' unless home_page.hero_title.visible?
  raise 'Home page hero has wrong text' unless home_page.hero_title.text == 'Welcome to the Parkinson’s UK Tech Guide'
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
  text = 'The Tech Guide helps you to...'
  raise 'Benefits heading is not present' unless home_page.heading2(text).present?
end

Then(/^there is a second-level heading saying "What’s new"$/) do
  text = 'What’s new'
  raise 'What’s new heading is not present' unless home_page.heading2(text).present?
end

Then(/^there is a third-level heading saying "Discover"$/) do
  text = 'Discover'
  raise "Benefits subheading '#{text}' is not present" unless home_page.subheading(text).present?
end

Then(/^there is a third-level heading saying "Understand"$/) do
  text = 'Understand'
  raise "Benefits subheading '#{text}' is not present" unless home_page.subheading(text).present?
end

Then(/^there is a third-level heading saying "Trust"$/) do
  text = 'Trust'
  raise "Benefits subheading '#{text}' is not present" unless home_page.subheading(text).present?
end

Then(/^there is a third-level heading saying "Recent reviews"$/) do
  text = 'Recent reviews'
  raise "Subheading '#{text}' is not present" unless home_page.subheading(text).present?
end

Then(/^there is a third-level heading saying "New products"$/) do
  text = 'New products'
  raise "Subheading '#{text}' is not present" unless home_page.subheading(text).present?
end

Then(/^there is a text block starting "New technology arrives all the time"$/) do
  text = 'New technology arrives all the time'
  raise "Benefits text block starting '#{text}' is not present" unless home_page.text_block_starting_with(text).present?
end

Then(/^there is a text block starting "Knowing what's out there is only part of the answer"$/) do
  text = 'Knowing what’s out there is only part of the answer'
  raise "Benefits text block starting '#{text}' is not present" unless home_page.text_block_starting_with(text).present?
end

Then(/^there is a text block starting "Our trusted reviews help you decide"$/) do
  text = 'Our trusted reviews help you decide'
  raise "Benefits text block starting '#{text}' is not present" unless home_page.text_block_starting_with(text).present?
end

Then(/^there are three cards containing the most recently published reviews in reverse chronological order$/) do
  raise 'Latest-product list does not include two items' unless home_page.latest_review_list.count == 2
  raise 'No actual latest-product cards' unless home_page.latest_review_card.present?
end

Then(/^each card includes the product name, a product image, the price-band indicator and a "Read review" button$/) do
  raise 'Latest-product card does not have the product name' unless home_page.latest_review_card.h4(data_cy: product-name).present?
  raise 'Latest-product card does not have an image' unless home_page.latest_review_card.img(data_cy: 'product-image').present?
  raise 'Latest-product card does not have a price range' unless home_page.latest_review_card.span(data_cy: 'price-range').present?
  raise 'Latest-product card does not have a CTA button' unless home_page.latest_review_card.a(data_cy: 'product-info-link').present?
end

Then(/^there is a horizontal list of five product names$/) do
  raise 'Latest products list is missing' unless home_page.latest_product_list.present?
  raise 'Latest products list does not have 5 items' unless home_page.latest_product_list.count == 5
end

Then(/^I see the PDP for that product$/) do
  raise "Expecting to be on the PDP for #{home_page.interesting_product_name} but the URL is wrong" unless TE.browser.url == home_page.interesting_product_url
end

Then(/^I am scrolled to the position of the review$/) do
  pending
  # Not working until the actual PDP is released
  raise 'PDP Trusted Review heading is not visible' unless product_page.trusted_review_heading.visible?
end
