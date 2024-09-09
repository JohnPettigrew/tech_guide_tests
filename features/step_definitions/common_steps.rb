Given(/^I am on the home page$/) do
  home_page.visit
  TestEvolve.audit('home_page')
end

Given(/^I am a visitor$/) do
  # Nothing needed - a visitor is someone without an account
end

When(/^I scroll to the top$/) do
  TestEvolve.browser.scroll.to :top
end
