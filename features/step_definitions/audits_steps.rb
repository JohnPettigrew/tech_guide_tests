Given(/^I navigate to the page to lighthouse check$/) do
  TE.browser.goto 'testevolve.io'
end

When(/^I perform no lighthouse check in the scenario$/) do
  # do nothing
end

Then(/^no lighthouse check is displayed in the report$/) do
  # do nothing
end

And(/^the scenario lighthouse test status should be '(.*)'$/) do |_status|
  # do nothing
end

When(/^I run TestEvolve\.lighthouse_check for label '(.*)'$/) do |label|
  TestEvolve.audit(label)
end

When(/^I run TestEvolve\.lighthouse_check for label '(.*)' when no lighthouse recommendations exist$/) do |label|
  TestEvolve.audit(label)
end

When(/^I run TestEvolve\.lighthouse_check for label '(.*)' when lighthouse recommendations exist$/) do |label|
  TE.audit(label)
end

Then(/^confirmation of a successful lighthouse check is displayed in the report$/) do
  # do nothing
end

Then(/^confirmation of a failed lighthouse check is displayed in the report$/) do
  # do nothing
end

When(/^multiple lighthouse checks occur for different labels where no thresholds were breached$/) do
  TE.config.audits.lighthouse.performance_threshold = 1
  TE.config.audits.lighthouse.accessibility_threshold = 1
  TE.config.audits.lighthouse.best_practices_threshold = 1
  TE.config.audits.lighthouse.seo_threshold = 1
  TestEvolve.audit('label1')
  TestEvolve.audit('label2')
  TestEvolve.audit('label3')
  TestEvolve.audit('label4')
end

When(/^I run TestEvolve\.lighthouse_check for label 'main page' and no minimum thresholds are breached$/) do
  TE.config.audits.lighthouse.performance_threshold = 1
  TE.config.audits.lighthouse.accessibility_threshold = 1
  TE.config.audits.lighthouse.best_practices_threshold = 1
  TE.config.audits.lighthouse.seo_threshold = 1
  TestEvolve.audit('main page')
end
