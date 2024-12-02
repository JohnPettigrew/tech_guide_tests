@working
Feature: Help area
  Background:
    Given I am on the help page
    And I reject cookies
    And I am a visitor

  Scenario: Help page structure is correct
    Then I see a first-level heading saying "Help and support for the Tech Guide"
    And I see the help-page hero text block
    And I see a search field
    And there are three subsections
    And there is at least one help card in each subsection
    And the first help card links to the 'What is the Tech Guide?' help article

  Scenario: Can search for a particular Help page
    When I type "bias" into the Search field
    And I click the Search button
    Then I see one search pill labelled 'bias'
    And I see search results that include the 'Transparency statement' page
    When I click on the first search result
    Then I am taken to the 'Transparency statement' page
    And the 'Transparency statement' page has the correct structure
