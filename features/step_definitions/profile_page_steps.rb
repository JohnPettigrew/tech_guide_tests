When(/^I am on my profile page$/) do
  profile_page.visit
  profile_page.wait_for_page_load
end

When(/^I click the Subscriptions tab$/) do
  profile_page.subscription_tab_label.click
end

When(/^I click on the security tab label$/) do
  profile_page.security_tab_label.click
end

When(/^I click on the subscriptions tab label$/) do
  profile_page.subscription_tab_label.click
end

When(/^I check the 'Get the email updates' checkbox$/) do
  profile_page.email_checkbox.set(true)
end

When(/^I uncheck the 'Get the email updates' checkbox$/) do
  profile_page.email_checkbox.set(false)
end

When(/^I check the 'Get the print edition' checkbox$/) do
  profile_page.print_checkbox.set(true)
end

When(/^I uncheck the 'Get the print edition' checkbox$/) do
  profile_page.print_checkbox.set(false)
end

When(/^I click the Save button$/) do
  profile_page.subscription_section_save_button.click
end

Then(/^the profile page passes an accessibility audit$/) do
  profile_page.wait_for_page_load
  profile_page.scan_for_accessibility
end

Then(/^I see a checkbox field labelled 'Get the email updates'$/) do
  raise 'Email checkbox not visible' unless profile_page.email_checkbox.visible?
end

Then(/^the 'Get the email updates' checkbox is checked$/) do
  raise 'Email checkbox not checked' unless profile_page.email_checkbox.checked?
end

Then(/^the 'Get the email updates' checkbox is not checked$/) do
  raise 'Email checkbox is checked' if profile_page.email_checkbox.checked?
end

Then(/^I see a checkbox field labelled 'Get the print edition'$/) do
  raise 'Print checkbox not visible' unless profile_page.print_checkbox.visible?
end

Then(/^the 'Get the print edition' checkbox is checked$/) do
  raise 'Print checkbox not checked' unless profile_page.print_checkbox.checked?
end

Then(/^the 'Get the print edition' checkbox is not checked$/) do
  raise 'Print checkbox is checked' if profile_page.print_checkbox.checked?
end

Then(/^I see a first-level heading saying 'Account'$/) do
  raise 'Page heading missing' unless profile_page.page_heading.present?
end

Then(/^I see three section tabs$/) do
  raise 'Profile section tab missing' unless profile_page.profile_tab_label.visible?
  raise 'Security section tab missing' unless profile_page.security_tab_label.visible?
  raise 'Subscriptions section tab missing' unless profile_page.subscription_tab_label.visible?
end

Then(/^the profile section tab is selected$/) do
  raise 'Profile section tab not selected' unless profile_page.profile_tab_label_active?
  raise 'Profile section tab heading not visible' unless profile_page.profile_section_heading.visible?
end

Then(/^the security tab is selected$/) do
  raise 'Security section tab not selected' unless profile_page.security_tab_label_active?
  raise 'Security section tab heading not visible' unless profile_page.security_section_heading.visible?
end

Then(/^the subscriptions tab is selected$/) do
  raise 'Subscriptions section tab not selected' unless profile_page.subscription_tab_label_active?
  raise 'Subscriptions section tab heading not visible' unless profile_page.security_section_heading.visible?
end

Then(/^I see a Save button$/) do
  profile_page.subscription_section_save_button.visible?
end

Then(/^I see a message 'Your preferences have been updated.'$/) do
  profile_page.wait_for_save_success_message
end
