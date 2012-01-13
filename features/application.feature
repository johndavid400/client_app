Feature: Application

  I should be able fill out a client application: 

  Scenario: An admin user should be able to view all applications
    Given an application exists with email "loser@example.com" and name "Tom"
    Given an application exists with email "fuser@example.com" and name "Ron"
    Given I am an authenticated admin user
    When I am on the home page
    Then I should see "fuser@example.com"
    And I should see "loser@example.com"

  Scenario: A user can fill out a client application
    Given I am on the home page
    And I follow "New Application"
    And I fill out the application
    And I click "Create Client application"
    Then I should see "Application submitted successfully"
    And the application's state should change to "submitted"

  Scenario: Isotope11 can view submitted applications
    Given an application exists with email "user@example.com" and name "Don"
    Given I am an authenticated admin user
    Then I should see "user@example.com"
    
