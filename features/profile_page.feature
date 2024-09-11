Feature: Profile pages
  @axe
  Scenario: Profile page is accessible
    Given I am on my profile page
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

  @working
  Scenario: Can adjust subscription preferences
