@audits @axe
Feature: Axe Audit Demo
  Enable Axe an audit in audits.yml and view the report
  generated in the results folder once the scenario is completed

  Scenario: No accessibility checks are performed - Axe
    Given I navigate to the page to accessibility check
    When I perform no accessibility check in the scenario
    Then no accessibility check is displayed in the report
    And the scenario accessibility test status should be 'skipped'

  Scenario: Accessibility Check has NO violations - Axe
    Given I navigate to the page to accessibility check
    And a baseline image exists for label 'main-page'
    When I run TestEvolve.accessibility_check for label 'main-page' when no accessibility violations exist
    Then confirmation of a successful accessibility check is displayed in the report
    And the scenario accessibility test status should be 'passed'

  Scenario: Accessibility check has violations - Axe
    Given I navigate to the page to accessibility check
    When I run TestEvolve.accessibility_check for label 'homepage' when accessibility violations exist
    Then confirmation of a failed accessibility check is displayed in the report
    And the scenario accessibility test status should be 'failed'

  Scenario: Accessibility checks don't record violations but the test functionally fails - Axe
    Given I navigate to the page to accessibility check
    When multiple accessibility checks occur for different labels
    But the test functionally fails and does not complete
    Then confirmation of a successful accessibility check is displayed in the report
    And the scenario accessibility test status should be 'error'