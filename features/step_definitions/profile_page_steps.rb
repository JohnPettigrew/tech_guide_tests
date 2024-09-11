When(/^I visit my profile page$/) do
  profile_page.visit
end

When(/^I click the Subscriptions tab$/) do
  profile_page.subscription_tab_label.click
end

Then(/^I see a checkbox field labelled 'Get the email updates' that is checked$/) do
  raise 'Email checkbox not visible' unless profile_page.email_checkbox.visible?
  raise 'Email checkbox not checked' unless profile_page.email_checkbox.checked?
end

Then(/^I see a checkbox field labelled 'Get the email updates' that is not checked$/) do
  raise 'Email checkbox not visible' unless profile_page.email_checkbox.visible?
  raise 'Email checkbox is checked' if profile_page.email_checkbox.checked?
end

Then(/^I see a checkbox field labelled 'Get the print edition' that is not checked$/) do
  raise 'Print checkbox not visible' unless profile_page.print_checkbox.visible?
  raise 'Print checkbox checked' if profile_page.print_checkbox.checked?
end

Then(/^I see a checkbox field labelled 'Get the print edition' that is checked$/) do
  raise 'Print checkbox not visible' unless profile_page.print_checkbox.visible?
  raise 'Print checkbox not checked' unless profile_page.print_checkbox.checked?
end
