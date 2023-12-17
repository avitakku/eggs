Feature: Profile Page Interaction
  As a user of the website
  I want to be able to view profiles
  So that I can learn more about the users and their goods/services

  Background: User is logged in and on the home page

  Scenario: User navigates to Aryan Ray's profile page
    Given I am on the login page
    And I fill in value for "Email/Username" with "ar4179"
    And I fill in value for "Password" with "defaultPassword"
    And I click the "Log In" button
    When I click on the Edit Profile link
    Then I confirm that I am on the "Aryan Ray" profile page
    And I should see the username "ar4179"
    And I should see the address "70 Morningside Dr."
    And I should see the contact "ar4179@columbia.edu"
    And I should see a rating of "4.7"
    And the following items should exist:
    | name          | category |
    | Mini Fridge   | Good     |
    

  Scenario: User wants to offer a new good/service
    Given I am on the login page
    And I fill in value for "Email/Username" with "ar4179"
    And I fill in value for "Password" with "defaultPassword"
    And I click the "Log In" button
    When I click on the Edit Profile link
    Then I confirm that I am on the "Aryan Ray" profile page
    When I click on the Offer a new good/service link
    Then I confirm that I am on the Offer a New Good or Service page
    And I should see a text box for name
    And I should see a text box for item description
    And I should see a Post button
