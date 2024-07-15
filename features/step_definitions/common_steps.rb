Given(/^I am on the home page$/) do
  home_page.visit
end

When(/^I scroll to the top$/) do
  TestEvolve.browser.scroll.to :top
end
