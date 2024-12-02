@working
Feature: Learn area
  Background:
    Given I am on the learn page
    And I reject cookies
    And I am a visitor

  Scenario: Learn page structure is correct
    Then I see a first-level heading saying "Learn more about technology & Parkinson's"
    And I see the learn-page hero text block
    And I see a search field on the Learn page
    And there is at least one learn card
    And there is a learn card that links to the 'What is an app?' learn article

  Scenario: Can search for a particular Learn page
    When I type 'app' into the Search field
    And I click the Search button
    Then I see one search pill labelled 'app'
    And I see search results that include the 'What is an app?' card
    When I click on the 'What is an app?' card
    Then I am taken to the 'What is an app?' page
    And the 'What is an app?' page has the correct structure
