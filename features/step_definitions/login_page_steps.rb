When(/^I am on the log-in page$/) do
  login_page.visit
  login_page.wait_for_page_load
end

When(/^I enter my email address into the Email field on the login page$/) do
  login_page.email_field.set(ENV['DEFAULT_USERNAME'])
end

When(/^I enter my password into the Password field on the login page$/) do
  login_page.password_field.set(ENV['DEFAULT_PASSWORD'])
end

When(/^I click the Continue login button$/) do
  login_page.continue_button.click
end

Then(/^the log-in page passes an accessibility audit$/) do
  login_page.wait_for_page_load
  login_page.scan_for_accessibility
end

Then(/^I am taken to the login page$/) do
  login_page.wait_for_page_load
end

Then(/^I see the Password field on the login page$/) do
  login_page.password_field.wait_until(&:visible?)
end
