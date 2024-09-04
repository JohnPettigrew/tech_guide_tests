Feature: Home page
  
  Scenario: Can see a hero area on the home page
    Given I am on the home page
    When I scroll to the top
    Then I see a top-level heading saying "Welcome to the Parkinson's UK Tech Guide"
    And I see the home-page hero text block
    And I see the hero image
    And I see the hero CTA button
    When I click on the hero CTA button
    Then I am taken to the product display page

  Scenario: Can see a benefits area on the home page
    Given I am on the home page
    Then there is a second-level heading saying "The Tech Guide helps you to..."
    And there is a third-level heading saying "Discover"
    And there is a text block starting "Parkinson's is different for everyone"
    And there is a third-level heading saying "Understand"
    And there is a text block starting "Knowing what’s out there is only part of the answer"
    And there is a third-level heading saying "Trust"
    And there is a text block starting "Our trusted reviews help you decide which devices or apps to trust"

  Scenario: Can see a What's new area on the home page
    Given I am on the home page
    Then there is a second-level heading saying "What’s new"
    And there is a third-level heading saying "Recent reviews"
    And there is at least one card containing a recently published review
    And each card includes the product name, a product image, the price-band indicator and a "Read review" button
    And there is a third-level heading saying "New products"
    And there is a horizontal list of five product names

  Scenario: Can read latest review directly from the home page
    Given I am on the home page
    When I click on the first card in the Recent reviews section
    Then I see the PDP for that product
    And I am scrolled to the position of the review

  Scenario: Can read the latest product page directly from the home page
    Given I am on the home page
    When I click on the first card in the New products section
    Then I see the PDP for that product

  @not_implemented
  Scenario: Can sign up to the email newsletter from the home page
    Given I am on the home page
    When I scroll down past the recent updates area
    Then I see a second-level heading saying 'Sign up for more'
    And under this a text block containing DATA_1
    And under this an email field labelled 'Email address'
    And under this a field labelled 'Password'
    And under this a checkbox labelled 'Get the email updates'
    And under this a checkbox labelled 'Get the print edition'
    And under this a button labelled 'Sign up'
    When I enter my email address into the field labelled 'Email address'
    And I enter my password into the field labelled 'Password'
    And I select the checkbox labelled 'Get the email updates'
    And I click the 'Sign up' button
    Then I see the home page
    And I see a flash message 'Thank you for creating an account on the Tech Guide. You will now get periodic updates from the Tech Guide (no more often than monthly).'

  @not_implemented
  Scenario: Can sign up to the print edition from the home page
    Given I am on the home page
    When I enter my email address into the field labelled 'Email address'
    And I enter my password into the field labelled 'Password'
    And I select the checkbox labelled 'Get the print edition'
    And I click the 'Sign up' button
    Then I see the Print Success page
    And I see the text DATA_2
    And I see the 'Go back home' button
    When I click the 'Go back home' button
    Then I see the home page

    # DATA_1: Get your monthly email update to hear about the latest Tech Guide articles.
    # If you prefer to read in print, you can also sign up for our occasional full printed edition by post, for free. Or try our downloadable PDFs to print yourself.
    # Fill in this form and choose which option you prefer (or both of them).

    # DATA_2: Thank you for creating an account on the Tech Guide. 
    # We plan to produce the first print edition in September 2024. The Tech Guide is still new, and we need to have enough reviews for it to be worth printing and sending out our first edition! 
    # When the time comes, we will email you to ask for your postal details.

  @working
  Scenario: Home page in-page navigation
    Given I am on the home page
    Then I see an in-page navigation area that lists the page sections
    When I click on 'The Tech Guide helps you to...' 
    Then the 'The Tech Guide helps you to...' section scrolls into view
    When I click on 'What's new?' 
    Then the 'What's new?' section scrolls into view
    When I click on 'Sign up for more' in the in-page nav area
    Then the 'Sign up for more' section scrolls into view
