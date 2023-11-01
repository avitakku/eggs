Feature: Learn more about "Textbooks" item

  Scenario: Navigate to the "Textbooks" item page
    Given I am on the Eggs home page
    When I click on the goods/service "Textbooks"
    Then I confirm that I am on the "Textbooks" item page
    And I should see the name "Avantika Garg"
    And I should see the email "ag4049@columbia.edu"
