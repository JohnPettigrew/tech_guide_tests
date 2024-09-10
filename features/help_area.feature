Feature: Help area
  @axe
  Scenario: Help page is accessible
    Given I am on the help page
    Then the help page passes an accessibility audit

  @not_implemented
  Scenario: Can see the purpose of the Help section
    Given I am a visitor
    And I am on the home page
    When I click the Help link in the global navbar
    Then I see the Help page
    And I see a hero area
    And I see a first-level heading saying "Help and support for the Tech Guide"
    And I see a text block starting "The Tech Guide is here to help you find new ways to improve your quality of life as someone with Parkinson's"

  @not_implemented
  Scenario: Can search for a particular Help page
    Given I am a visitor
    And I am on the Help page
    When I type "bias" into the Search field
    And I click the Search button
    Then I see search results that include the "Transparency statement" page
    When I click on the "Transparency statement" entry in the search results
    Then I see the Transparency statement page

  @not_implemented
  Scenario: admin can add help articles
    Given I am an admin
    And I have signed into Strapi
    And I am on the Help Resources page
    Then I see the main page area on the right has the heading 'Help articles'
    And I see a button labelled 'Create new entry'
    When I click the 'Create new entry' button
    Then I see the main page area on the right has the heading 'Create an entry'
    When I enter 'New Help article' into the Title field
    And I click the 'Regenerate' button in the slug field
    And I enter 'Random text' into the summary field
    And I choose 'policies' from the type dropdown
    And I click the Save button
    Then I see a flash message saying 'Success'
    And I see the main page area on the right has the heading 'New Help article'
    When I click the Back link
    And I click the column header ID twice
    Then I see the top row has the value 'New Help article' in the Name column
    And I see the top row has the value 'Draft' in the State column

  @not_implemented
  Scenario: Cleaning up after creating a new Help article
    Given I am an admin user
    And I am signed into Strapi
    And I am in the Content Manager
    And I have clicked the Help Resources link
    And I have clicked the ID column heading twice
    When I click the trash can icon in the top row
    Then I see a confirmation dialogue
    When I click the Delete button
    Then I see a flash message saying "Success"
    And I see the Help Resources page
    And the tow row does not contain "New Help article" in the Name column
