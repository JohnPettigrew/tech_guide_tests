Then(/^I see the cookie-consent banner$/) do
  raise 'Cookie banner "Reject" button not visible' unless cookie_banner.reject_button.visible?
end

Then(/^the cookie-consent banner has a link to our cookie policy$/) do
  raise 'Cookie-policy missing' unless cookie_banner.policy_link.visible?
end

Then(/^I do not see the cookie-consent banner$/) do
  cookie_banner.wait_until_closed
end

Then(/^the Pendo code loads$/) do
  cookie_banner.script_tag.wait_until(&:exists?)
end

Then(/^the Pendo code does not load$/) do
  raise "Pendo script loaded" if cookie_banner.script_tag.exists?
end
