Given(/^I am a visitor$/) do
  # Nothing needed - a visitor is someone without an account
end

Given(/^I am a user$/) do
  pending
end


When(/^I scroll to the top$/) do
  TestEvolve.browser.scroll.to :top
end
