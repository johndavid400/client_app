Feature: Application

  I should be able fill out a client application: 

  Scenario: An admin user should be able to view all applications
    Given an application exists with email "loser@example.com" and name "Tom"
    Given an application exists with email "fuser@example.com" and name "Ron"
    Given I am an authenticated admin user
    When I am on the client applications index page
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
    
  Scenario: Isotope11 can view Client application show page
    Given an application exists with email "user@example.com" and name "Don"
    Given I am an authenticated admin user
    When I visit the show page for application with email "user@example.com"
    Then I should see "Don" 

  Scenario: An error message should occur if an application does not pass validations
    Given I am on the home page
    And I follow "New Application"
    And I click "Create Client application"
    Then I should see "Email can't be blank"

  Scenario: An admin should be able to edit an application
    Given an application exists with email "user@example.com" and name "Don"
    Given I am an authenticated admin user
    And I am on the client applications index page
    When I follow "Edit"
    Then I should see "request information"

  Scenario: An admin should be able to request attachments from the client
    Given I am on an application's edit page
    And I check "client_application_articles_of_incorporation"
    And I check "client_application_business_license"
    And I click "Submit"
    When I follow "Edit"
    Then I should see "Articles of incorporation"
    And I should see "Business license"

  Scenario: An admin should be able to delete an application
    Given an application exists with email "user@example.com" and name "Don"
    Given I am an authenticated admin user
    And I am on the client applications index page
    When I follow "Delete"
    Then I should see "Client Application successfully deleted"
  
#  Scenario: An admin should be able to finish an application
#    Given I am on an application's edit page
#    And I check "client_application_business_license"
#    And I click "Submit"
#    When I follow "Edit"
#    And I should see "Business license"
#    When I click "Submit"
#    Then I follow "Edit"
#    Then I choose "client_application_returned_0"
#    And I click "Submit"
#    Then I should see "completed"

  Scenario: An admin should be able to return an application
    Given I am on an application's edit page
    And I check "client_application_business_license"
    And I click "Submit"
    When I follow "Edit"
    And I should see "Business license"
    When I click "Submit"
    Then I follow "Edit"
    Then I choose "client_application_returned_1"
    And I click "Submit"
    Then the application state should be "submitted"

  Scenario: A non-admin should not have access to other client application show pages
    Given an application exists with email "restricted@example.com" and name "restricted"
    Given I am an authenticated user
    Given I am on the home page
    When I visit the show page for application with email "restricted@example.com"
    Then I should be redirected to the home page

  Scenario: A non-admin should not have access to other client application edit pages
    Given an application exists with email "restricted@example.com" and name "restricted"
    Given I am an authenticated user
    Given I am on the home page
    When I visit the edit page for application with email "restricted@example.com"
    Then I should be redirected to the home page

  Scenario: A visitor should have restricted access
    Given an application exists with email "restricted@example.com" and name "restricted"
    Given I am on the home page
    When I visit the show page for application with email "restricted@example.com"
    Then I should be redirected to the home page

