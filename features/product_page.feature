Feature: Product pages
  Background:
    Given I am on the product page for Parkinson's ON
    And I reject cookies
    And I am a visitor

@working
  Scenario: PDP structure is correct
    Then the page heading is 'Parkinson’s ON'
