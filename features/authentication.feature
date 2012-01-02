Feature: Authentication

  Users should be able to log in:

  Scenario: An admin user can log in from the home page
    Given an admin user exists
    And I am on the home page
    And I fill in "user_email" with "admin@example.com"
    And I fill in "user_password" with "password"
    When I click "Sign in"
    Then I should see "Signed in successfully"

  Scenario: A normal user can log in from the home page
    Given an application exists with email "test@example.com"
    And I am on the home page
    And I fill in "user_email" with "test@example.com"
    And I fill in "user_password" with "password"
    When I click "Sign in"
    Then I should see "Signed in successfully"

  Scenario: A user should be able to log out
    Given an application exists with email "test@example.com"
    And I am on the home page
    And I fill in "user_email" with "test@example.com"
    And I fill in "user_password" with "password"
    When I click "Sign in"
    And I follow "Sign out"
    Then I should see "Signed out successfully"
