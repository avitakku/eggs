Feature: offer, edit, and delete new good or service

As a student
I want to be able to add new goods or services that show up on my profile

Background:
    
Given I am on the login page
And I fill in value for "Email/Username" with "ar4179"
And I fill in value for "Password" with "defaultPassword"
And I click the "Log In" button
When I click on the Edit Profile link
Then the following items should exist:
| name          | category |
| Mini Fridge   | Good     |

Scenario: Editing an Item
    Given I press the "Edit" link
    When I fill in value for "Name" with "Mega Fridge"
    And I fill in value for "Item Description" with "really big fridge"
    And I select category "Good" from "Category"
    And I click the "Update" button
    And the following items should exist:
    | name          | category |
    | Mega Fridge   | Good     |

Scenario: Deleting an Item
    Given I click the "Delete" link
    Then I should not see the following items: Mini Fridge

Scenario: Adding a New Good
    Given I visit the "Offer a New Good or Service" page
    When I fill in value for "Name" with "Eggs"
    And I fill in value for "Item Description" with "3 large eggs"
    And I select category "Good" from "Category"
    And I click the "Post" button
    And the following items should exist:
    | name          | category |
    | Mini Fridge   | Good     |
    | Eggs          | Good     |

Scenario: Adding a New Service
    Given I visit the "Offer a New Good or Service" page
    When I fill in value for "Name" with "Tutoring"
    And I fill in value for "Item Description" with "Math tutoring service"
    And I select "Service" from "Category"
    And I click the "Post" button
    And the following items should exist:
    | name          | category |
    | Mini Fridge   | Good     |
    | Tutoring      | Service  |


