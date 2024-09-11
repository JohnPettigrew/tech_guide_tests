Given(/^I am a visitor$/) do
  # Nothing needed - a visitor is someone without an account
end

Given(/^I am a user$/) do
  login_page.visit
  login_page.email_field.set(ENV['DEFAULT_USERNAME'])
  login_page.continue_button.click
  login_page.password_field.wait_until(&:present?)
  login_page.password_field.set(ENV['DEFAULT_PASSWORD'])
  login_page.continue_button.click
  home_page.wait_for_page_load
end


When(/^I scroll to the top$/) do
  TestEvolve.browser.scroll.to :top
end
