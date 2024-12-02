Given(/^I am on the product page for Parkinson's ON$/) do
  product_page(product_name: 'parkinsons_on').wait_for_page_load
end

Then(/^the page heading is 'Parkinson’s ON'^/) do
  raise 'Page heading not visible' unless product_page.page_heading.visible?
end
