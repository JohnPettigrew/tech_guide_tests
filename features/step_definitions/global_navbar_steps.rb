When(/^I click the Help link in the desktop navbar$/) do
  global_navbar.menu_entry_4.click
  TestEvolve.browser.h1(text: /Help/).wait_until(&:exists?)
end

Then(/^I see the global navbar$/) do
  raise 'Tech Guide content is not visible' unless global_navbar.content.visible?
end

Then(/^I see the Tech Guide logo in the global navbar$/) do
  raise 'Tech Guide logo is not visible' unless global_navbar.logo.visible?
end

Then(/^I see a button that links to the global Parkinson's UK website in the desktop navbar$/) do
  raise 'Button to global website is not visible' unless global_navbar.main_puk_button.visible?
  raise 'Link back to global website is not correct' unless global_navbar.main_puk_button_link == PARKINSONS_UK_URL
end

Then(/^I see a Home link in the desktop navbar$/) do
  raise 'Home link not visible in desktop navbar' unless global_navbar.menu_entry_1.visible?
end

Then(/^I see a Catalogue link in the desktop navbar$/) do
  raise 'Catalogue link not visible in desktop navbar' unless global_navbar.menu_entry_2.visible?
end

Then(/^I see a Learn link in the desktop navbar$/) do
  raise 'Learn link not visible in desktop navbar' unless global_navbar.menu_entry_3.visible?
end

Then(/^I see a Help link in the desktop navbar$/) do
  raise 'Help link not visible in desktop navbar' unless global_navbar.menu_entry_4.visible?
end

Then(/^I see a Log in button in the desktop navbar$/) do
  raise 'Log-in button not visible' unless global_navbar.log_in_button.visible?
end

Then(/^I see a Sign up button in the desktop navbar$/) do
  raise 'Sign-up button not visible' unless global_navbar.sign_up_button.visible?
end

Then(/^I see a highlighted Home link in the desktop navbar$/) do
  raise 'Home link is not highlighted on home page' unless global_navbar.menu_entry_1_highlighted.present?
end

Then(/^I see a highlighted Help link in the desktop navbar$/) do
  raise 'Help link is not highlighted on help page' unless global_navbar.menu_entry_4_highlighted.present?
end
