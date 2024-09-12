Feature: Account management

  Scenario: Can create a new account
    Given I am on the home page
    And I am a visitor
    When I click the Sign up button in the desktop navbar
    Then I am taken to the sign-up page
    And I do not see a message confirming that my password is acceptable
    When I enter a random email address into the Email field
    And I enter a short password into the Password field
    Then I see a message saying that my password is too short
    When I enter a long, random password into the Password field
    Then I see a message confirming that my password is acceptable
    When I click the Continue sign-up button
    # Fails at this point with an error (similar to home-page signup failure):"Sign up unsuccessful due to failed security validations. Please refresh the page to try again or reach out to support for more assistance."
    # Then I am taken to the home page
    # And I see the My profile button in the global navbar

  Scenario: Can sign in to my account
    Given I am on the home page
    And I am a visitor
    When I click the Log in button in the desktop navbar
    Then I am taken to the login page
    When I enter my email address into the Email field
    And I click the Continue login button
    Then I see the Password field
    When I enter my password into the Password field
    And I click the Continue login button
    Then I am taken to the home page
    And I see the My profile button in the global navbar

  @working
  Scenario: Can sign out of my account
    Given I am on the help page
    And I am a user
    When I click the Sign out button in the desktop navbar
    Then I am taken to the home page
    And I see a Log in button in the desktop navbar
