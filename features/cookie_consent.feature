Feature: Cookie consent
# Using Incognito/Private mode ensures that we're in an environment where cookie consent has not previously been recorded
  
  Scenario: I can reject cookies
    Given I am on the home page
    And I am in Incognito mode
    And I am a visitor
    Then I see the cookie-consent banner
    When I click Reject cookies
    Then I do not the cookie-consent banner
    And Google Analytics does not load

  Scenario: I can accept cookies
    Given I am on the home page
    And I am in Incognito mode
    And I am a visitor
    Then I see the cookie-consent banner
    When I click Accept cookies
    Then I do not the cookie-consent banner
    And Google Analytics loads

  Scenario: My choice to accept cookies persists
    Given I am in Incognito mode
    And I am a visitor
    And I have previously clicked Accept cookies
    When I visit the home page
    Then I do not see the cookie-consent banner

  Scenario: My choice to reject cookies persists
    Given I am in Incognito mode
    And I am a visitor
    And I have previously clicked Reject cookies
    When I visit the home page
    Then I do not see the cookie-consent banner
