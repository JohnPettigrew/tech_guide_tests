@working
Feature: Cookie consent
  
  Scenario: I can reject cookies
    Given I am on the home page
    And I am a visitor
    Then I see the cookie-consent banner
    And the cookie-consent banner has a link to our cookie policy
    When I reject cookies
    Then I do not see the cookie-consent banner
    And the Pendo code does not load

  Scenario: I can accept cookies
    Given I am on the home page
    And I am a visitor
    Then I see the cookie-consent banner
    When I accept cookies
    Then I do not see the cookie-consent banner
    And the Pendo code loads

  Scenario: My choice to accept cookies persists
    Given I am on the home page
    And I accept cookies
    And I am a visitor
    When I am on the catalogue page
    Then I do not see the cookie-consent banner
    And the Pendo code loads

  Scenario: My choice to reject cookies persists
    Given I am on the home page
    And I reject cookies
    And I am a visitor
    When I am on the catalogue page
    Then I do not see the cookie-consent banner
    And the Pendo code does not load
