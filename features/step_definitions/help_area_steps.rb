Given(/^I am on the help page$/) do
  help_page.visit
end

Then('the help page passes an accessibility audit') do
  help_page.wait_for_page_load
  help_page.scan_for_accessibility
end
