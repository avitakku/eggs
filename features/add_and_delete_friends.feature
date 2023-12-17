Feature: Adding and deleting new friends

  As a user
  So that I can find goods and services that are relevant to me
  I want to be able to find users and be able to add them as new connections

  Background: 
  Given I am on the login page
  And I fill in value for "Email/Username" with "ar4179"
  And I fill in value for "Password" with "defaultPassword"
  And I click the "Log In" button

  Scenario: Add and Delete new friend
    Then the following items should exist:
    | Good          | Name             |   Category  |  Degree of Connection
    | Bike          | Aditi Mutagi     |   Good      |  No Connection
    | Tutoring      | Aditi Mutagi     |   Service   |  No Connection
    | Textbooks     | Avantika Garg    |   Good      |  No Connection
    | Laptop Repair | Joshua Mei       |   Service   |  No Connection
    
    When I click on the Edit Profile link
    And the following users should exist: 
    | Name          | Contact Info |
    And I press the "Add Friends" link
    Then I confirm that I am on the "Users" page
    And the following users should exist:

    | Name          | Contact Info         |
    | Aditi Mutagi  | agm2208@columbia.edu |
    | Avantika Garg | ag4049@columbia.edu  |
    | Joshua Mei	| jzm2103@columbia.edu |
    | Aryan Ray     | ar4179@columbia.edu  |

    Then I click on my friend "Joshua Mei"
    Then I confirm that I am on the "Joshua Mei" friend page
    When I fill in value for "Friend Key" with "15842"
    And I click the "Add" button
    Then the following users should exist: 
    | Name          | Contact Info       |
    | Joshua Mei  | jzm2103@columbia.edu |
    
    And I click the "Remove" link
    Then I should not see the following items: "Joshua Mei" 