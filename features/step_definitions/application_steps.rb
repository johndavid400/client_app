Then /^the application's state should change to "([^"]*)"$/ do |state|
  @application = ClientApplication.last
  @application.application_state.should == "submitted"
end

Given /^I fill out the application$/ do
  fill_in 'client_application_business_name', with: 'Acme'
  fill_in 'client_application_email', with: 'acme@example.com'
  fill_in 'client_application_phone_number', with: '555-555-5555'
  fill_in 'client_application_years_in_business', with: '2'
  fill_in 'client_application_number_of_employees', with: '10'
  fill_in 'client_application_business_address', with: '123 Main St.'
  fill_in 'client_application_billing_address', with: '900 Forest Ave.'
  fill_in 'client_application_city', with: 'Beverly Hills'
  fill_in 'client_application_zip', with: '90210'
end
