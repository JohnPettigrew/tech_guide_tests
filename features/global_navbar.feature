Feature: Global navbar
  
  Scenario: I see the global navbar
    Given I am on the home page
    And I am a visitor
    Then I see the global navbar
    And I see the Tech Guide logo in the global navbar
    And I see a Home link in the desktop navbar
    And I see a Catalogue link in the desktop navbar
    And I see a Learn link in the desktop navbar
    And I see a Help link in the desktop navbar
    And I see a button that links to the global Parkinson's UK website in the desktop navbar
    And I see a Log in button in the desktop navbar
    And I see a Sign up button in the desktop navbar

  Scenario: I see navigation links highlighted depending on the current page
    Given I am on the home page
    Then I see a highlighted Home link in the desktop navbar
    When I click the Help link in the desktop navbar
    Then I see a highlighted Help link in the desktop navbar

  Scenario: I can sign in to my account
    Given I am on the home page
    And I am a visitor
    When I click the Log in button
    Then I am taken to the login page
    When I enter my email address into the Email field
    And I click the Continue button
    Then I see the Password field
    When I enter my password into the Password field
    And I click the Continue button
    Then I am taken to the home page
    And I see the My profile button in the global navbar
