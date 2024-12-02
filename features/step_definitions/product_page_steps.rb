Given(/^I am on the product page for Parkinson's ON$/) do
  @parkinsons_on_page = product_page(product_name: 'parkinsons-on')
  @parkinsons_on_page.visit
  @parkinsons_on_page.wait_for_page_load
end

Then(/^the page heading is 'Parkinson’s ON'$/) do
  raise 'Page heading not visible' unless @parkinsons_on_page.page_heading.visible?
end
