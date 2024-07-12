Then(/^there is a global navbar$/) do
  raise 'Tech Guide logo was not visible' unless global_navbar.logo.svg.visible?
  raise 'Button to global website was not visible' unless global_navbar.main_puk_button.visible?
  raise 'Link back to global website was not correct' unless global_navbar.main_puk_link.a.href == PARKINSONS_UK_URL
end
