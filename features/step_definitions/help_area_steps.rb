Given(/^I am on the help page$/) do
  help_page.visit
end

When(/^I type "bias" into the Search field$/) do
  help_page.search_field.set("bias")
end

When(/^I click the Search button$/) do
  help_page.search_button.click
end

When(/^I click on the first search result$/) do
  help_page.search_results.first.click
end

Then('the help page passes an accessibility audit') do
  help_page.wait_for_page_load
  help_page.scan_for_accessibility
end

Then(/^I see a first-level heading saying "Help and support for the Tech Guide"$/) do
  raise 'Page title is missing' unless help_page.hero_title.present?
  raise 'Page title is not visible' unless help_page.hero_title.visible?
end

Then(/^I see the help-page hero text block$/) do
  raise 'Hero text is missing' unless help_page.hero_text.count.positive?
  raise 'Hero text is not visible' unless help_page.hero_text.first.visible?
end

Then(/^I see a search field$/) do
  raise 'Search field is missing' unless help_page.search_field.present?
  raise 'Search field is not visible' unless help_page.search_field.visible?
end

Then(/^there are three subsections$/) do
  raise '"What is the Tech Guide?" subsection missing' unless help_page.section_1.present?
  raise '"What is the Tech Guide?" subheading missing' unless help_page.section_1.h2.present?
  raise '"How to use the Tech Guide" subsection missing' unless help_page.section_2.present?
  raise '"How to use the Tech Guide" subheading missing' unless help_page.section_2.h2.present?
  raise '"Our policies" subsection missing' unless help_page.section_3.present?
  raise '"Our policies" subheading missing' unless help_page.section_3.h2.present?
end

Then(/^there is at least one help card in each subsection$/) do
  raise 'First subsection has no help cards' unless help_page.section_1_articles.count.positive?
  raise 'Second subsection has no help cards' unless help_page.section_2_articles.count.positive?
  raise 'Third subsection has no help cards' unless help_page.section_3_articles.count.positive?
end

Then(/^the first help card links to the 'What is the Tech Guide\?' help article$/) do
  raise 'First help card link is wrong' unless help_page.section_1_first_link.href == "#{help_page.url}/what-is-the-tech-guide"
end

Then(/^I see one search pill labelled 'bias'$/) do
  raise 'Too many search pills' unless help_page.search_filter_pills.count == 1
  raise 'Search pill is not visible' unless help_page.search_filter_pills.first.text == 'bias'
end

Then(/^I see search results that include the 'Transparency statement' page$/) do
  raise 'Search results do not include the transparency statement' unless help_page.search_results.first.href == "#{help_page.url}/transparency-statement"
end

Then(/^I am taken to the 'Transparency statement' page$/) do
  raise 'Individual Help page has the wrong title' unless help_page.transparency_statement_hero_title.visible?
  raise 'Individual Help page has missing content summary' unless help_page.transparency_statement_content_summary.visible?
  raise 'Individual Help page has missing content' unless help_page.transparency_statement_content.count.positive?
end
