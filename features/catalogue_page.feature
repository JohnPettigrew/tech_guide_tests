Feature: Catalogue page
  @axe
  Scenario: Catalogue page is accessible
    Given I am on the catalogue page
    Then the catalogue page passes an accessibility audit

  Scenario: Catalogue page structure is correct
    Given I am on the catalogue page
    Then I see a first-level heading saying "Explore the catalogue"
    And I see the catalogue-page hero text block
    And I see the key-filters block
    And I see a product search field
    And I see the product filters button
    And I see the reset product filters button
    And I see 'Results: x products'
    And there is at least one product card
    And a product card links to Parkinson's ON

  Scenario: Can search to find a particular product
    Given I am on the catalogue page
    When I type 'cue' into the product search field
    And I click the product search button
    Then I see one pill
    And I see a pill labelled 'cue'
    And I see search results that include the Cue1+
    And I see search results that do not include Parkinson's ON

  Scenario: Can filter to find a particular product
    Given I am on the catalogue page
    When I click the product filters button
    Then the product filters modal opens
    When I click 'Free'
    And I click the Apply Filters button
    Then I see a pill labelled 'Free'
    And I see search results that include Parkinson's ON
    And I see search results that do not include the Cue1+
    When I click the reset filters button
    Then I do not see any pills
    And I see search results that include Parkinson's ON
    And I see search results that include the Cue1+
