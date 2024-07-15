Then(/^I see the global navbar$/) do
  raise 'Tech Guide content is not visible' unless global_navbar.content.visible?
end

Then(/^I see the Tech Guide logo in the global navbar$/) do
  raise 'Tech Guide logo is not visible' unless global_navbar.logo.visible?
end

Then(/^I see a button that links to the global Parkinson's UK website in the desktop navbar$/) do
  raise 'Button to global website is not visible' unless global_navbar.main_puk_button.visible?
  raise 'Link back to global website is not correct' unless global_navbar.main_puk_button.a.href == PARKINSONS_UK_URL
end

Then(/^I see a Home link in the desktop navbar$/) do
  raise 'Home link not visible in desktop navbar' unless global_navbar.menu_entry_1.a.href == '/'
end
