Given(/^I am on the learn page$/) do
  learn_page.visit
  learn_page.wait_for_page_load
end

When(/^I type 'app' into the Search field$/) do
  learn_page.search_field.set('app')
end

When(/^I click the Search button on the Learn page$/) do
  learn_page.search_button.click
end

When(/^I click on the 'What is an app\?' card$/) do
  learn_page.apps_article.scroll.to :viewport
  learn_page.apps_article.click
end

Then(/^the learn page passes an accessibility audit$/) do
  learn_page.scan_for_accessibility
end

Then(/^I see a first-level heading saying "Learn more about technology \& Parkinson's"$/) do
  raise 'Page title is missing' unless learn_page.hero_title.present?
  raise 'Page title is not visible' unless learn_page.hero_title.visible?
end

Then(/^I see the learn-page hero text block$/) do
  raise 'Hero text is missing' unless learn_page.hero_text.count.positive?
  raise 'Hero text is not visible' unless learn_page.hero_text.first.visible?
end

Then(/^I see a search field on the Learn page$/) do
  raise 'Search field is missing' unless learn_page.search_field.present?
  raise 'Search field is not visible' unless learn_page.search_field.visible?
end

Then(/^there is at least one learn card$/) do
  raise 'No learn cards' unless learn_page.articles.count.positive?
end

Then(/^there is a learn card that links to "What is freezing of gait\?" on the main website$/) do
  raise '"What is freezing of gait?" learn card link is wrong' unless learn_page.freezing_article_card_link.href == "https://www.parkinsons.org.uk/information-and-support/freezing"
end

Then(/^there is a learn card that links to the 'What is an app\?' learn article$/) do
  raise '"What is an app?" learn card link is wrong' unless learn_page.apps_article_card_link.href == "#{learn_page.url}/what-is-an-app-a-beginner-s-guide"
end

Then(/^I see one search pill labelled 'app'$/) do
  raise 'Too many search pills' unless learn_page.search_filter_pills.count == 1
  raise 'Search pill is not visible' unless learn_page.search_filter_pills.first.text == 'app'
end

Then(/^I see search results that include the 'What is an app\?' card$/) do
  raise 'Search results do not include the "What is an app?" card' unless learn_page.search_results.include?("#{learn_page.url}/what-is-an-app-a-beginner-s-guide")
end

Then(/^I am taken to the 'What is an app\?' page$/) do
  learn_page.wait_for_apps_article_page_load
end

Then(/^the 'What is an app\?' page has the correct structure$/) do
  raise 'Individual Learn page has the wrong title' unless learn_page.apps_article_hero_title.visible?
  raise 'Individual Learn page has missing content summary' unless learn_page.apps_article_content_summary.visible?
  raise 'Individual Learn page has missing content' unless learn_page.apps_article_content.count.positive?
end

