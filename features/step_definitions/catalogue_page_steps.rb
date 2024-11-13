Given(/^I am on the catalogue page$/) do
  catalogue_page.visit
end

When(/^I type 'cue' into the product search field$/) do
  catalogue_page.search_field.set('cue')
end

When(/^I click the product search button$/) do
  catalogue_page.search_button.click
end

When(/^I click the product filters button$/) do
  catalogue_page.filters_button.click
end

When(/^I click 'Free'$/) do
  catalogue_page.filters_option_free.scroll.to :viewport
  catalogue_page.filters_option_free.click
end

When(/^I click the Apply Filters button$/) do
  catalogue_page.apply_filters_button.click
end

When(/^I click the reset filters button$/) do
  catalogue_page.reset_filters_button.click
end

Then(/^the catalogue page passes an accessibility audit$/) do
  catalogue_page.scan_for_accessibility
end

Then(/^I see a first-level heading saying "Explore the catalogue"$/) do
  raise 'Page title is missing' unless catalogue_page.hero_title.present?
  raise 'Page title is not visible' unless catalogue_page.hero_title.visible?
end

Then(/^I see the catalogue-page hero text block$/) do
  raise 'Hero text is missing' unless catalogue_page.hero_text.count.positive?
  raise 'Hero text is not visible' unless catalogue_page.hero_text.first.visible?
end

Then(/^I see the key-filters block$/) do
  raise 'Key filters are missing' unless catalogue_page.key_filters.count.positive?
  raise 'Key filters are not visible' unless catalogue_page.key_filters.first.visible?
end

Then(/^I see a product search field$/) do
  raise 'Search field is missing' unless catalogue_page.search_field.present?
  raise 'Search field is not visible' unless catalogue_page.search_field.visible?
end

Then(/^I see the product filters button$/) do
  raise 'Filters button is missing' unless catalogue_page.filters_button.present?
  raise 'Filters button is not visible' unless catalogue_page.filters_button.visible?
end

Then(/^I see the reset product filters button$/) do
  raise 'Reset-filters button is missing' unless catalogue_page.reset_filters_button.present?
  raise 'Reset-filters button is not visible' unless catalogue_page.reset_filters_button.visible?
end

Then(/^I see 'Results: x products'$/) do
  raise 'Results summary is missing' unless catalogue_page.results_summary.present?
  raise 'Results summary is not visible' unless catalogue_page.results_summary.visible?
end

Then(/^there is at least one product card$/) do
  raise 'Catalogue page has no product cards' unless catalogue_page.product_cards.count.positive?
end

Then(/^a product card links to Parkinson's ON$/) do
  raise 'Parkinson\'s ON product card is missing' unless catalogue_page.product_card_links.include?("#{catalogue_page.url}/parkinsons-on")
end

Then(/^I do not see any pills$/) do
  catalogue_page.search_filter_pills.wait_until(count: 0)
  # raise "There are #{catalogue_page.search_filter_pills.count} search pills when none were expected" unless catalogue_page.search_filter_pills.count.zero?
end

Then(/^I see one pill$/) do
  raise 'Too many search pills' unless catalogue_page.search_filter_pills.count == 1
end

Then(/^I see a pill labelled 'cue'$/) do
  raise 'Search pill "cue" is not visible' unless catalogue_page.search_filter_pill_labels.include?('cue')
end

Then(/^I see a pill labelled 'Free'$/) do
  raise 'Search pill "Free" is not visible' unless catalogue_page.search_filter_pill_labels.include?('Free')
end

Then(/^I see cards that include the Cue1\+$/) do
  raise 'Search results do not include the Cue1+' unless catalogue_page.product_card_links.include?("#{catalogue_page.url}/cue1plus")
end

Then(/^I see cards that do not include the Cue1\+$/) do
  raise 'Search results include the Cue1+' if catalogue_page.product_card_links.include?("#{catalogue_page.url}/cue1plus")
end

Then(/^I see cards that include Parkinson's ON$/) do
  raise search_result_links.to_s unless catalogue_page.product_card_links.include?("#{catalogue_page.url}/parkinsons-on")
end

Then(/^I see cards that do not include Parkinson's ON$/) do
  raise 'Search results include Parkinson\'s ON' if catalogue_page.product_card_links.include?("#{catalogue_page.url}/parkinsons-on")
end

Then(/^the product filters modal opens$/) do
  catalogue_page.filters_modal.wait_until(&:visible?)
end
