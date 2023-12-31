Feature: display list of goods and services

  As a student
  So that I can find goods and services that are relevant to me
  I want search goods and services by keyword and/or by category

  Background: goods and services in database

  Given the following items exist:
  | name          | category |
  | Bike          | Good     |
  | Tutoring      | Service  |
  | Textbooks     | Good     |
  | Laptop Repair | Service  |
  
  Given I am on the login page
  And I fill in value for "Email/Username" with "ar4179"
  And I fill in value for "Password" with "defaultPassword"
  And I click the "Log In" button


  Scenario: filter items by category
    Given I check the following categories: Good
    And I uncheck the following categories: Service
    And I click the refresh button
    Then I should see the following items: Bike, Textbooks
    And I should not see the following items: Tutoring, Laptop Repair

  Scenario: search items by keyword
    When I fill in 'Search-bar' with "Bike"
    And I click the search button
    Then I should see the following items: Bike
    And I should not see the following items: Tutoring, Laptop Repair
