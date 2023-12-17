Feature: Registering a new User

  As a new user
  So that I can use the app
  I want to be able to create my user profile

  Background: 
  Given I am on the blank page
  And I click the "Sign Up" link

  Scenario: Register New User
    And I fill in value for "Name" with "Junfeng Yang"
    And I fill in value for "Username" with "prof"
    And I fill in value for "Email" with "prof@columbia.edu"
    And I fill in value for "Password*" with "newPassword"
    And I fill in value for "Password Confirmation*" with "newPassword"
    And I click the "Sign Up" button
    Then I should be on the Eggs home page
