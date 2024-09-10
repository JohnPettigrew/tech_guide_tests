When(/^I enter my email address into the Email field$/) do
  login_page.email_field.set(ENV['DEFAULT_USERNAME'])
end

When(/^I enter my password into the Password field$/) do
  login_page.password_field.set(ENV['DEFAULT_PASSWORD'])
end

When(/^I click the Continue button$/) do
  login_page.continue_button.click
end

Then(/^I am taken to the login page$/) do
  login_page.wait_for_page_load
end

Then(/^I see the Password field$/) do
  login_page.password_field.wait_until(&:present?)
end