Feature: offer new good or service

As a student
I want to be able to add new goods or services that show up on my profile

Background:
    Given I visit the "Offer a New Good or Service" page


Scenario: Adding a New Good
    When I fill in value for "Name" with "Eggs"
    And I fill in value for "Item Description" with "3 large eggs"
    And I select category "Good" from "Category"
    And I click the "Post" button
    And the following items should exist:
    | name          | category |
    | Mini Fridge   | Good     |
    | Eggs          | Good     |

Scenario: Adding a New Service
    When I fill in value for "Name" with "Tutoring"
    And I fill in value for "Item Description" with "Math tutoring service"
    And I select "Service" from "Category"
    And I click the "Post" button
    And the following items should exist:
    | name          | category |
    | Mini Fridge   | Good     |
    | Tutoring          | Service     |