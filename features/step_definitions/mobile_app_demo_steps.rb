Given(/^I scroll to the Buttons section of the Main Screen$/) do
  main_screen.scroll_to_section('buttons-section')
end

Given(/^I scroll to the TextInput section of the Main Screen$/) do
  main_screen.scroll_to_section('alert-section')
end

Given(/^I scroll to the Alert section of the Main Screen$/) do
  main_screen.scroll_to_section('alert-section')
end

When(/^I select to trigger the alert$/) do
  main_screen.press_alert_trigger_button
end

When(/^I enter "([^"]*)" in the TextInput and submit$/) do |text_to_enter|
  main_screen.submit_text(text_to_enter)
end

Then(/^I can locate and press the example button with multiple locators$/) do
  main_screen.press_example_button_multiple_ways
end

Then(/^an alert is displayed with text "([^"]*)"$/) do |expected_text|
  sleep 2
  actual_text = main_screen.retrieve_alert_message_text
  raise("Alert text was '#{actual_text}', not '#{expected_text}'") if actual_text != expected_text
end

Then(/^the section is updated with the text "([^"]*)"$/) do |expected_text|
  main_screen.verify_submitted_text(expected_text)
end

Given(/^I navigate to the homescreen in the app$/) do
  main_screen.scroll_to_section('buttons-section')
end
