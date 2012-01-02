Feature: Application

  I should be able fill out a client application: 

  Scenario: A user can fill out a client application
    Given I am on the home page
    And I follow "New Application"
    And I fill in "client_application_business_name" with "Testico"
    And I fill in "client_application_email" with "test@example.com"
    And I click "Create Client application"
    Then I should see "Application submitted successfully"
    And the application's state should change to "submitted"

  Scenario: Isotope11 can view submitted applications
    Given an application exists with email "user@example.com" 
    Given I am an authenticated admin user
    Then I should see "user@example.com"
    
