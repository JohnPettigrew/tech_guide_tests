When(/^I am on the sign-up page$/) do
  sign_up_page.visit
  sign_up_page.wait_for_page_load
end

When(/^I enter a random email address into the Email field on the sign-up page$/) do
  sign_up_page.email_field.set(sign_up_page.random_email)
end

When(/^I enter a short password into the Password field on the sign-up page$/) do
  sign_up_page.password_field.set('12edsc')
end

When(/^I enter a long, random password into the Password field on the sign-up page$/) do
  sign_up_page.password_field.set(sign_up_page.random_password)
end

When(/^I click the Continue sign-up button$/) do
  sign_up_page.continue_button.click
end

Then(/^the sign-up page passes an accessibility audit$/) do
  sign_up_page.scan_for_accessibility
end

Then(/^I am taken to the sign-up page$/) do
  sign_up_page.wait_for_page_load
end

Then(/^I see the Password field on the sign-up page$/) do
  sign_up_page.password_field.wait_until(&:visible?)
end

Then(/^I do not see a message that my password is not acceptable$/) do
  raise 'Password short message is visible' if sign_up_page.password_short_message.visible?
end

Then(/^I see a message saying that my password is too short$/) do
  sign_up_page.password_short_message.wait_until(&:visible?)
end

Then(/^I do not see a message saying that my password is too short$/) do
  raise 'Long password still gives "password too short" error' if sign_up_page.password_short_message.visible?
end
