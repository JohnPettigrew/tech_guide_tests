@demo-app-visual-testing
Feature: Mobile App Visual Testing Demo

  Scenario: No mobile app visual checks are performed
    Given I navigate to the homescreen in the app
    When I perform no visual check in the scenario
    Then no visual check is displayed in the report
    And the scenario visual test status should be 'skipped'

  Scenario: No baseline exists for a label
    Given I navigate to the homescreen in the app
    When I run TestEvolve.mobile_app.visual_check for a label that has no baseline
    Then the new baseline image is displayed in the report
    And the scenario visual test status should be 'new'

  Scenario: Mobile app visual check matches the baseline for a label
    Given I navigate to the homescreen in the app
    And a baseline image exists for label 'main-screen'
    When I run TestEvolve.mobile_app.visual_check for label 'main-screen' when no visual regressions have occurred
    Then confirmation of a successful visual check is displayed in the report
    And the scenario visual test status should be 'passed'

  Scenario: Mobile app visual check fails match against baseline for a label
    Given I navigate to the homescreen in the app
    And a mobile_app baseline image exists for label 'homescreen'
    When I run TestEvolve.mobile_app.visual_check for label 'homescreen' when visual regressions have occurred
    Then confirmation of a failed visual check is displayed in the report
    And the scenario visual test status should be 'failed'

  Scenario: Mobile app visual check matches the baseline for a label but test functionally fails
    Given I navigate to the homescreen in the app
    When multiple visual checks occur for different labels where no visual regressions have occurred
    But the test functionally fails and does not complete
    Then confirmation of a successful visual check is displayed in the report
    And the scenario visual test status should be 'error'
