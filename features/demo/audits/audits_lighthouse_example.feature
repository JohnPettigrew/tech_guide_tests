@audits @lighthouse
Feature: Lighthouse Audit Demo
  Enable a Lighthouse audit in audits.yml and view the report
  generated in the results folder once the scenario is completed

  Scenario: No lighthouse checks are performed - Lighthouse
    Given I navigate to the page to lighthouse check
    When I perform no lighthouse check in the scenario
    Then no lighthouse check is displayed in the report
    And the scenario lighthouse test status should be 'skipped'

  Scenario: Lighthouse scores have breached specified minimum thresholds - Lighthouse
    Given I navigate to the page to lighthouse check
    When I run TestEvolve.lighthouse_check for label 'homepage' when lighthouse recommendations exist
    Then confirmation of a failed lighthouse check is displayed in the report
    And the scenario lighthouse test status should be 'failed'

  Scenario: Lighthouse checks do not break the category thresholds but the test functionally fails - Lighthouse
    Given I navigate to the page to lighthouse check
    When multiple lighthouse checks occur for different labels where no thresholds were breached
    But the test functionally fails and does not complete
    Then confirmation of a successful lighthouse check is displayed in the report
    And the scenario lighthouse test status should be 'error'

  Scenario: Lighthouse Checks don't breach user thresholds - Lighthouse
    Given I navigate to the page to lighthouse check
    When I run TestEvolve.lighthouse_check for label 'main page' and no minimum thresholds are breached
    Then confirmation of a successful lighthouse check is displayed in the report
    And the scenario lighthouse test status should be 'passed'