Feature: Help area
  @axe
  Scenario: Help page is accessible
    Given I am on the help page
    Then the help page passes an accessibility audit

  Scenario: Help page structure is correct
    Given I am on the help page
    Then I see a first-level heading saying "Help and support for the Tech Guide"
    And I see the help-page hero text block
    And I see a search field
    And there are three subsections
    And there is at least one help card in each subsection
    And the first help card links to the 'What is the Tech Guide?' help article

@working
  Scenario: Can search for a particular Help page
    Given I am on the help page
    When I type "bias" into the Search field
    And I click the Search button
    Then I see one search pill labelled 'bias'
    And I see search results that include the 'Transparency statement' page
    When I click on the first search result
    Then I am taken to the 'Transparency statement' page
    And the 'Transparency statement' page has the correct structure

  # Scenario: admin can add help articles
  #   Given I am an admin
  #   And I have signed into Strapi
  #   And I am on the Help Resources page
  #   Then I see the main page area on the right has the heading 'Help articles'
  #   And I see a button labelled 'Create new entry'
  #   When I click the 'Create new entry' button
  #   Then I see the main page area on the right has the heading 'Create an entry'
  #   When I enter 'New Help article' into the Title field
  #   And I click the 'Regenerate' button in the slug field
  #   And I enter 'Random text' into the summary field
  #   And I choose 'policies' from the type dropdown
  #   And I click the Save button
  #   Then I see a flash message saying 'Success'
  #   And I see the main page area on the right has the heading 'New Help article'
  #   When I click the Back link
  #   And I click the column header ID twice
  #   Then I see the top row has the value 'New Help article' in the Name column
  #   And I see the top row has the value 'Draft' in the State column
