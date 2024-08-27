Feature: Global navbar
  
  Scenario: Desktop navbar exists
    Given I am on the home page
    Then I see the global navbar

  Scenario: I see Tech Guide logo in the global navbar
    Given I am on the home page
    Then I see the Tech Guide logo in the global navbar

  Scenario: I see Tech Guide navigation links in the desktop navbar
    Given I am on the home page
    Then I see a Home link in the desktop navbar
    And I see a Catalogue link in the desktop navbar
    And I see a Learn link in the desktop navbar
    And I see a Help link in the desktop navbar

  Scenario: I see Tech Guide profile buttons in the desktop navbar
    Given I am on the home page
    Then I see a Log in button in the desktop navbar
    And I see a Sign up button in the desktop navbar

  Scenario: I see a button to the global Parkinson's UK site in the desktop navbar
    Given I am on the home page
    Then I see a button that links to the global Parkinson's UK website in the desktop navbar

  Scenario: I see navigation links highlighted depending on the current page
    Given I am on the home page
    Then I see a highlighted Home link in the desktop navbar
    When I click the Help link in the desktop navbar
    Then I see a highlighted Help link in the desktop navbar
