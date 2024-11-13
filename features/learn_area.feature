Feature: Learn area
  Scenario: Learn page structure is correct
    Given I am on the learn page
    Then I see a first-level heading saying "Learn more about technology & Parkinson's"
    And I see the learn-page hero text block
    And I see a search field on the Learn page
    And there is at least one learn card
    And there is a learn card that links to the 'What is an app?' learn article

  Scenario: Can search for a particular Learn page
    Given I am on the learn page
    When I type 'app' into the Search field
    And I click the Search button
    Then I see one search pill labelled 'app'
    And I see search results that include the 'What is an app?' card
    When I click on the 'What is an app?' card
    Then I am taken to the 'What is an app?' page
    And the 'What is an app?' page has the correct structure

  # Scenario: admin can add learn articles
  #   Given I am an admin
  #   And I have signed into Strapi
  #   And I am on the Learn Resources page
  #   Then I see the main page area on the right has the heading 'Learn articles'
  #   And I see a button labelled 'Create new entry'
  #   When I click the 'Create new entry' button
  #   Then I see the main page area on the right has the heading 'Create an entry'
  #   When I enter 'New Learn article' into the Title field
  #   And I click the 'Regenerate' button in the slug field
  #   And I enter 'Random text' into the summary field
  #   And I choose 'policies' from the type dropdown
  #   And I click the Save button
  #   Then I see a flash message saying 'Success'
  #   And I see the main page area on the right has the heading 'New Learn article'
  #   When I click the Back link
  #   And I click the column header ID twice
  #   Then I see the top row has the value 'New Learn article' in the Name column
  #   And I see the top row has the value 'Draft' in the State column
