@backend
Feature: Test RESTful services with Create, Delete and Update user actions

  Scenario: Create user
    When I call the API for creating a user
    Then User should be created

  Scenario: Create user with posting data
    When I call the API for creating a user with data:
      |Name          |Benjamin Kane  |
      |Email         |bkane@email.com|
      |Date_of_Birth |10.10.1960     |
      |Phone_Number  |0884653535     |
    Then User should be created with details:
      |Name          |Benjamin Kane  |
      |Email         |bkane@email.com|
      |Date_of_Birth |10.10.1960     |
      |Phone_Number  |0884653535     |

  Scenario: Update the user name and phone
    Given I call the API for creating a user
    And I change user name as "Burkay Celik"
    Then User name should be "Burkay Celik"
    And I change phone number as "0884123456"
    Then phone number should be "0884123456"

  Scenario: Delete the user
    Given I call the API for creating a user
    And I call the API for deleting user
    Then User should be deleted