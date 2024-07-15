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
