Feature: Adding new friends

  As a user
  So that I can find goods and services that are relevant to me
  I want to be able to find users and be able to add them as new connections

  Background: Given I visit the "Aryan Ray" profile page

  Scenario: Check current friends
    And the following friends should exist: 
    | Name          | Contact Info |

  Scenario: Add new friend
    When I click on the "Add Friends" button
    Then I should see "All Users"
    And the following friends should exist:
    | Name          | Contact Info |
    | Aditi Mutagi  | agm2208@columbia.edu     |
    | Avantika Garg | ag4049@columbia.edu     |
    | Joshua Mei	| jzm2103@columbia.edu     |
    | Aryan Ray     | ar4179@columbia.edu     |

