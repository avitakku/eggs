Feature: display list of goods and services

  As a student
  So that I can find goods and services that are relevant to me
  I want search goods and services by keyword and/or by category

Background: goods and servics in database

  Given the following items exist:
  | name          | category |
  | Bike          | Good     |
  | Tutoring      | Service  |
  | Textbooks     | Good     |
  | Laptop Repair | Service  |
  | Mini Fridge   | Good     |

Given I am on the Eggs home page

Scenario: filter items by category
  Given I check the following categories: Good
  And I uncheck the following categories: Service
  And I submit the search form
  Then I should see the following items: Bike, Textbooks, Mini Fridge
  And I should not see the following items: Tutoring, Laptop Repair

Scenario: find movie with same director
  Given I am on the details page for "Star Wars"
  When  I follow "Find Movies With Same Director"
  Then  I should be on the Similar Movies page for "Star Wars"
  And   I should see "THX-1138"
  But   I should not see "Blade Runner"

Scenario: can't find similar movies if we don't know director (sad path)
  Given I am on the details page for "Alien"
  Then  I should not see "Ridley Scott"
  When  I follow "Find Movies With Same Director"
  Then  I should be on the home page
  And   I should see "'Alien' has no director info"
