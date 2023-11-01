Feature: Profile Page Interaction
  As a user of the website
  I want to be able to view profiles
  So that I can learn more about the users and their goods/services

  Background: User is logged in and on the home page

  Scenario: User navigates to Aryan Ray's profile page
    Given I am on the Eggs home page
    When I click on the Edit Profile link
    Then I confirm that I am on the "Aryan Ray" profile page
    Then I should see the username "ar4179"
    Then I should see the address "70 Morningside Dr."
    Then I should see the contact "ar4179@columbia.edu"
    And I should see a rating of "4.7"
    And I should see the goods/services provided by "Aryan Ray"
    And I should see a good named "Mini Fridge" in the category "Good"
