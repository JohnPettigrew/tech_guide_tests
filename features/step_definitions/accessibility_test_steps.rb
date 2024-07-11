Given(/^I navigate to the page to accessibility check$/) do
  TE.browser.goto 'testevolve.io'
end

When(/^I perform no accessibility check in the scenario$/) do
  # do nothing
end

Then(/^no accessibility check is displayed in the report$/) do
  # do nothing
end

And(/^the scenario accessibility test status should be '(.*)'$/) do |_status|
  # do nothing
end

When(/^I run TestEvolve\.accessibility_check for label '(.*)'$/) do |label|
  TestEvolve.audit(label)
end

When(/^I run TestEvolve\.accessibility_check for label '(.*)' when no accessibility violations exist$/) do |label|
  TestEvolve.audit(label)
end

When(/^I run TestEvolve\.accessibility_check for label '(.*)' when accessibility violations exist$/) do |label|
  TE.audit(label)
end

Then(/^confirmation of a successful accessibility check is displayed in the report$/) do
  # do nothing
end

Then(/^confirmation of a failed accessibility check is displayed in the report$/) do
  # do nothing
end

When(/^multiple accessibility checks occur for different labels$/) do
  TestEvolve.audit('label1')
  TestEvolve.audit('label2')
  TestEvolve.audit('label3')
  TestEvolve.audit('label4')
end
