Given(/^I have previously given cookie consent$/) do
  # Assumes that a page has already loaded
  # TE.browser.cookies.add 'OptanonAlertBoxClosed', '2024-05-07T14:51:18.378Z'
  cookie_banner.wait_until_present(cookie_banner.reject_button).click
end

Given(/^I am a visitor$/) do
  if TE.browser.url.present? && global_navbar.sign_out_button.visible?
    global_navbar.sign_out_button.click
    home_page.wait_for_page_load
  end
end

Given(/^I am a user$/) do
  if TE.browser.url.present? && global_navbar.sign_out_button.visible?
    global_navbar.sign_out_button.click
    home_page.wait_for_page_load
  end
  login_page.visit
  cookie_banner.wait_until_present(cookie_banner.reject_button).click
  login_page.email_field.set(ENV['DEFAULT_USERNAME'])
  login_page.continue_button.click
  login_page.password_field.wait_until(&:present?)
  login_page.password_field.set(ENV['DEFAULT_PASSWORD'])
  login_page.continue_button.click
  home_page.wait_for_page_load
end

Given(/^I reject cookies$/) do
  cookie_banner.reject_button.click
end

Given(/^I accept cookies$/) do
  cookie_banner.accept_button.click
end

When(/^I scroll to the top$/) do
  TestEvolve.browser.scroll.to :top
end
