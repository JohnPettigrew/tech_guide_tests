@axe
Feature: Accessibility
  Scenario: Account pages are accessible
    Given I am a visitor
    And I am on the log-in page
    Then the log-in page passes an accessibility audit
    When I am on the sign-up page
    Then the sign-up page passes an accessibility audit
    When I am a user
    And I am on my profile page
    Then the profile page passes an accessibility audit
    When I click on the subscriptions tab label
    Then the profile page passes an accessibility audit

  Scenario: Catalogue page is accessible
    Given I am on the catalogue page
    And I am a visitor
    Then the catalogue page passes an accessibility audit

  Scenario: Help page is accessible
    Given I am on the help page
    And I am a visitor
    Then the help page passes an accessibility audit

  Scenario: Home page is accessible
    Given I am on the home page
    And I reject cookies
    And I am a visitor
    Then the home page passes an accessibility audit
  
  Scenario: Learn page is accessible
    Given I am on the learn page
    Then the learn page passes an accessibility audit
