Then /^the application's state should change to "([^"]*)"$/ do |state|
  @application = ClientApplication.last
  @application.application_state.should == "submitted"
end

Given /^I fill out the application$/ do
  fill_in 'client_application_business_name', with: 'Acme'
  fill_in 'client_application_first_name', with: 'Wiley'
  fill_in 'client_application_last_name', with: 'Cyote'
  fill_in 'client_application_email', with: 'acme@example.com'
  fill_in 'client_application_phone_number', with: '555-555-5555'
  fill_in 'client_application_years_in_business', with: '2'
  fill_in 'client_application_number_of_employees', with: '10'
  fill_in 'client_application_business_address', with: '123 Main St.'
  fill_in 'client_application_billing_address', with: '900 Forest Ave.'
  fill_in 'client_application_city', with: 'Beverly Hills'
  fill_in 'client_application_zip', with: '90210'
end

Given /^an application exists with email "([^"]*)" and name "([^"]*)"$/ do |email, name|
  alabama = State.create name: "Alabama"
  @user = FactoryGirl.create :user, email: email
  @application = FactoryGirl.create :client_application, email: email, business_name: name, first_name: "Wiley", last_name: "Cyote", user: @user, phone_number: "555-555-5555", years_in_business: "2", number_of_employees: "2", business_address: "200 street", billing_address: "300 street", city: "Topeka", zip: "20020", state: alabama
  @application.submit!
end


Given /^I am on an application's edit page$/ do
  step %(an application exists with email "user@user.com" and name "Joey")
  step %(I am an authenticated admin user)
  application = ClientApplication.find_by_email("user@user.com")
  visit edit_client_application_path(application)
end

Then /^the application state should be "([^"]*)"$/ do |app_state|
  ClientApplication.find_by_email("user@user.com").application_state.should == app_state
end

Given /^I check "([^"]*)"$/ do |checkbox|
  check(checkbox)
end

Then /^I choose "([^"]*)"$/ do |button|
  choose(button)
end

