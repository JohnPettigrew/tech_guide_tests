Feature: Account management

  Scenario: Can create a new account
    Given I am on the home page
    And I am a visitor
    When I click the Sign up button in the desktop navbar
    Then I am taken to the sign-up page
    And I do not see a message confirming that my password is acceptable
    When I enter a random email address into the Email field on the sign-up page
    And I enter a short password into the Password field on the sign-up page
    Then I see a message saying that my password is too short
    When I enter a long, random password into the Password field on the sign-up page
    Then I see a message confirming that my password is acceptable
    When I click the Continue sign-up button
    # Fails at this point with an error (similar to home-page signup failure):"Sign up unsuccessful due to failed security validations. Please refresh the page to try again or reach out to support for more assistance."
    # Then I am taken to the home page
    # And I see the My profile button in the global navbar

  Scenario: Can sign in and out of my account
    Given I am on the home page
    And I am a visitor
    When I click the Log in button in the desktop navbar
    Then I am taken to the login page
    When I enter my email address into the Email field on the login page
    And I click the Continue login button
    Then I see the Password field on the login page
    When I enter my password into the Password field on the login page
    And I click the Continue login button
    Then I am taken to the home page
    And I see the My profile button in the global navbar
    When I click the Sign out button in the desktop navbar
    Then I am taken to the home page
    And I see a Log in button in the desktop navbar

  @axe
  Scenario: Account pages are accessible
    Given I am a visitor
    And I am on the log-in page
    Then the log-in page passes an accessibility audit
    When I am on the sign-up page
    Then the sign-up page passes an accessibility audit
    When I am a user
    And I am on my profile page
    Then the profile page passes an accessibility audit
    When I click on the subscriptions tab label
    Then the profile page passes an accessibility audit

  Scenario: Profile page structure is correct
    Given I am a user
    And I am on my profile page
    Then I see a first-level heading saying 'Account'
    And I see three section tabs
    And the profile section tab is selected
    When I click on the security tab label
    Then the security tab is selected
    When I click on the subscriptions tab label
    Then the subscriptions tab is selected
    And I see a checkbox field labelled 'Get the email updates'
    And I see a checkbox field labelled 'Get the print edition'
    And I see a Save button

  Scenario: Can adjust subscription preferences
    Given I am a user
    And I am on my profile page
    When I click on the subscriptions tab label
    Then the 'Get the email updates' checkbox is checked
    And the 'Get the print edition' checkbox is not checked
    When I uncheck the 'Get the email updates' checkbox
    And I click the Save button
    Then I see a message 'Your preferences have been updated.'
    And the 'Get the email updates' checkbox is not checked
    When I check the 'Get the email updates' checkbox
    And I click the Save button
    Then I see a message 'Your preferences have been updated.'
    And the 'Get the email updates' checkbox is checked
    When I check the 'Get the print edition' checkbox
    And I click the Save button
    Then I see a message 'Your preferences have been updated.'
    And the 'Get the print edition' checkbox is checked
    When I uncheck the 'Get the print edition' checkbox
    And I click the Save button
    Then I see a message 'Your preferences have been updated.'
    And the 'Get the print edition' checkbox is not checked
