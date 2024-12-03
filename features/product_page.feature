Feature: Product pages
  Background:
    Given I am on the product page for Parkinson's ON
    And I reject cookies

@working
  Scenario: PDP structure is correct
    Given I am a visitor
    Then the page heading is 'Parkinson’s ON'
    And the price band tag is 'Free'
    And the company name is 'Parkinson’s ON Ltd'
    And there is a last-updated date
    And there is a product description
    And there is an image gallery section
    And there is one large product image in the image gallery
    And there are at least two thumbnail images in the image gallery
    And there is a Download/Buy button
    And there is an in-page navbar
    And there is a Features section
    And the Features section has at least 5 bullet points
    And there is a Categories subsection
    And there is a category row showing the Product Type as 'App'
    And there is a category row showing the Helps With as including 'Taking my pills'
    And there is a Panel review section on this product page
    And the panel review on this product page has a Quick Overview subheading
    And the panel review on this product page has a Highs and Lows box
    And the panel review on this product page has a Background section
    And the panel review on this product page has a 'Read the full review' link
    And the panel review on this product page has a 'Read time' value
    And there is a Community Views section
    And the Community Views section has a 'Share your view' button
    And there is a Learn More section
    And the Learn More section includes a link to the 'What is an app?' article
    And the Learn More section includes at least one link to an article in the 'Information and support' section of the main PUK website
    And there is a Questions section
    And the first question has the subheading 'Impartiality and transparency'
    And the first question includes a link to the transparency-policy Help page
    And there is a Details section
    And there is a Details row showing the Cost as 'Free'
    And there is a Details row showing the app Size
    And there is a Details row showing the app Version
    And there is a Details row showing the app supported Phone Type

  Scenario: PDP lightbox works
    Given I am a visitor
    Then the lightbox opens when I click the large gallery image
    And the lightbox has a large product image
    And the lightbox has left and right arrow buttons
    And the main image changes when I click the image-gallery left button
    And the main image changes when I click the image-gallery right button
    And the lightbox has at least two thumbnail images
    And the main image changes when I click the second thumbnail image
    And the lightbox has a button with the text 'Back to Parkinson’s ON'
    And the lightbox closes when I click on the button with the text 'Back to Parkinson’s ON'
    And the lightbox opens when I click the large gallery image
    And the lightbox closes when I hit the Escape keyboard key

  Scenario: Community views works
    Given I am a user
    And I am on the product page for Parkinson's ON
    When I click the 'Share my view' button
    Then I see a form with a link to the community guidelines Help page
    And I see a question 'Do you like Parkinson’s ON?' that is required
    And I see two options: 'Yes' and 'No'
    And I see a question 'Why do you feel this way?' that is required
    And I see a text field with a prompt 'Please consider...'
    And I see a notice to enter 'Min 12 characters'
    And I see a Cancel button
    And I see a Share button
    When I click the Cancel button
    Then the form closes
    When I click the 'Share my view' button
    And I click the 'Yes' option to the first question
    Then the 'Yes' option is selected
    When I click the 'No' option to the first question
    Then the 'No' option is selected
    When I enter 'Nineteen characters' to answer the second question
    Then I see a notice that I have entered '19 of 280 max characters'
    When I enter 'This is just a test of 280 characters.  This is just a test of 280 characters.  This is just a test of 280 characters.  This is just a test of 280 characters.  This is just a test of 280 characters.  This is just a test of 280 characters.  This is just a test of 280 characters.  ' into the field for the second question
    Then I see a notice that I have entered '280 of 280 max characters'
    And I cannot enter more text into the field for the second question
    When I click the Share button
    Then I see a pending post with the text 'This is just a test of 280 characters.  This is just a test of 280 characters.  This is just a test of 280 characters.  This is just a test of 280 characters.  This is just a test of 280 characters.  This is just a test of 280 characters.  This is just a test of 280 characters.  '
    And I see a notice that 'This post won’t appear publicly until it’s approved by our moderators'
    And I see a reminder notice about the community guidelines
