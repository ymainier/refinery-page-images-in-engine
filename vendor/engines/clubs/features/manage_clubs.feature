@clubs
Feature: Clubs
  In order to have clubs on my website
  As an administrator
  I want to manage clubs

  Background:
    Given I am a logged in refinery user
    And I have no clubs

  @clubs-list @list
  Scenario: Clubs List
   Given I have clubs titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of clubs
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @clubs-valid @valid
  Scenario: Create Valid Club
    When I go to the list of clubs
    And I follow "Add New Club"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 club

  @clubs-invalid @invalid
  Scenario: Create Invalid Club (without name)
    When I go to the list of clubs
    And I follow "Add New Club"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 clubs

  @clubs-edit @edit
  Scenario: Edit Existing Club
    Given I have clubs titled "A name"
    When I go to the list of clubs
    And I follow "Edit this club" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of clubs
    And I should not see "A name"

  @clubs-duplicate @duplicate
  Scenario: Create Duplicate Club
    Given I only have clubs titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of clubs
    And I follow "Add New Club"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 clubs

  @clubs-delete @delete
  Scenario: Delete Club
    Given I only have clubs titled UniqueTitleOne
    When I go to the list of clubs
    And I follow "Remove this club forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 clubs
 