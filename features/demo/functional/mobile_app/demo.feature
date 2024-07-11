@demo-app
Feature: Test Evolve Spark Demo App

  Scenario: Pressing Buttons with multiple locators
    Given I scroll to the Buttons section of the Main Screen
    Then I can locate and press the example button with multiple locators

  Scenario: Entering text in a TextInput and submitting with a button
    Given I scroll to the TextInput section of the Main Screen
    When I enter "example text" in the TextInput and submit
    Then the section is updated with the text "example text"

  Scenario: Verifying Alert text
    Given I scroll to the Alert section of the Main Screen
    When I select to trigger the alert
    Then an alert is displayed with text "Button pressed"
