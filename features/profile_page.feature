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
