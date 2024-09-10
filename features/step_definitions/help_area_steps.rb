Given(/^I am on the help page$/) do
  help_page.visit
end

Then('the help page passes an accessibility audit') do
  help_page.scan_for_accessibility
end
