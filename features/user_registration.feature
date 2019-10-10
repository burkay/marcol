@frontend
Feature: Test user creation form with various data scenarios

  Scenario: Successfully create a new User
    Given I am on the test registration page
    And I fill the form with:
      |Name           |Burkay             |
      |Email          |burkay@email.com   |
      |Date_of_Birth  |06.03.1986         |
      |Phone_Number   |0884653533         |
      |Gender         |Male               |
      |Country        |Bulgaria           |
      |City           |Sofia              |
      |Street_Address |Nikolay Haytov Str.|
    When I click submit
    Then I see "We have received your registration." message

  Scenario: Try to create user without City to see the warning
    Given I am on the test registration page
    And I fill the form with:
      |Name           |Burkay             |
      |Email          |burkay@email.com   |
      |Date_of_Birth  |06.03.1986         |
      |Phone_Number   |0884653533         |
      |Gender         |Male               |
      |Country        |Bulgaria           |
      |City           |                   |
      |Street_Address |Nikolay Haytov Str.|
    When I click submit
    Then I should see a field required message

  Scenario: (UnHappy Flow)Failing Scenario when trying to create user empty Street
    Given I am on the test registration page
    And I fill the form with:
      |Name           |Burkay             |
      |Email          |burkay@email.com   |
      |Date_of_Birth  |06.03.1986         |
      |Phone_Number   |0884653533         |
      |Gender         |                   |
      |Country        |Bulgaria           |
      |City           |Sofia              |
      |Street_Address |                   |
    When I click submit
    Then I see "We have received your registration." message


  Scenario: Try to create user without Country to see the warning
    Given I am on the test registration page
    And I fill the form with:
      |Name           |Burkay             |
      |Email          |burkay@email.com   |
      |Date_of_Birth  |06.03.1986         |
      |Phone_Number   |0884653533         |
      |Gender         |Male               |
      |Country        |                   |
      |City           |Sofia              |
      |Street_Address |Nikolay Haytov Str.|
    When I click submit
    Then I should see a field required message

  Scenario: (UnHappy Flow)Failing Scenario when enter "MyNumber" as Phone number
    Given I am on the test registration page
    And I fill the form with:
      |Name           |Burkay             |
      |Email          |burkay@email.com   |
      |Date_of_Birth  |06.03.1986         |
      |Phone_Number   |MyNumber           |
      |Gender         |                   |
      |Country        |Bulgaria           |
      |City           |Sofia              |
      |Street_Address |                   |
    When I click submit
    Then I see "We have received your registration." message

  Scenario: Enter Wrong Email format to see the warning
    Given I am on the test registration page
    And I fill the form with:
      |Name           |Burkay             |
      |Email          |burkay@email       |
      |Date_of_Birth  |06.03.1986         |
      |Phone_Number   |0884653533         |
      |Gender         |Male               |
      |Country        |Bulgaria           |
      |City           |Sofia              |
      |Street_Address |Nikolay Haytov Str.|
    When I click submit
    Then I should see a field valid email required message

  Scenario: (UnHappy Flow)Failing Scenario when creating user without Name
    Given I am on the test registration page
    And I fill the form with:
      |Name           |                   |
      |Email          |burkay@email.com   |
      |Date_of_Birth  |06.03.1986         |
      |Phone_Number   |MyNumber           |
      |Gender         |                   |
      |Country        |Bulgaria           |
      |City           |Sofia              |
      |Street_Address |Nikolay Haytov Str.|
    When I click submit
    Then I see "We have received your registration." message

  Scenario: Create user without selection gender since it's not required
    Given I am on the test registration page
    And I fill the form with:
      |Name           |Burkay             |
      |Email          |burkay@email.com   |
      |Date_of_Birth  |06.03.1986         |
      |Phone_Number   |0884653533         |
      |Gender         |                   |
      |Country        |Bulgaria           |
      |City           |Sofia              |
      |Street_Address |Nikolay Haytov Str.|
    When I click submit
    Then I see "We have received your registration." message


