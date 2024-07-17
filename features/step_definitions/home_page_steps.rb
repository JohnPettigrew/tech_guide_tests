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
  raise 'Benefits heading is not present' unless home_page.benefits_heading.present?
  raise 'Benefits heading text is unexpected' unless home_page.benefits_heading.text == "The Tech Guide helps you to..."
end

Then(/^there is a third-level heading saying "Discover"$/) do
  text = "Discover"
  raise "Benefits subheading '#{text}' is not present" unless home_page.benefits_subheading(text).present?
end

Then(/^there is a third-level heading saying "Understand"$/) do
  text = "Understand"
  raise "Benefits subheading '#{text}' is not present" unless home_page.benefits_subheading(text).present?
end

Then(/^there is a third-level heading saying "Trust"$/) do
  text = "Trust"
  raise "Benefits subheading '#{text}' is not present" unless home_page.benefits_subheading(text).present?
end

Then(/^there is a text block starting "New technology arrives all the time"$/) do
  text = "New technology arrives all the time, and Parkinson’s is complicated. The Tech Guide shows you what’s available. When you read about something new, we’re here to put it in context. We can’t tell you what’s right for your own unique situation, but we can make sure you know your options."
  raise "Benefits text block starting '#{text}' is not present" unless home_page.benefits_text_block(text).present?
end

Then(/^there is a text block starting "Knowing what's out there is only part of the answer"$/) do
  text = "Knowing what’s out there is only part of the answer. The Tech Guide helps you understand what tech actually offers and puts the tech in context - everything from “what is an app and how do I get one?” to “what is freezing of gait, why does cueing help, and why would I spend money on a wearable device instead of listening to music on my headphones?”"
  raise "Benefits text block starting '#{text}' is not present" unless home_page.benefits_text_block(text).present?
end

Then(/^there is a text block starting "Our trusted reviews help you decide"$/) do
  text = "Our trusted reviews help you decide which devices or apps to trust with your money, your time and your health. We give tech to people with Parkinson’s for several weeks. From their feedback, we build a single, clear review. We don’t recommend or endorse any particular product, but help you make confident decisions for yourself."
  raise "Benefits text block starting '#{text}' is not present" unless home_page.benefits_text_block(text).present?
end
