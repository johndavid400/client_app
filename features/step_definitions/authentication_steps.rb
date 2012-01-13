Given /^an admin user exists$/ do
  @user = User.create :email => "admin@example.com", :password => "password", :password_confirmation => "password"
  @user.admin = true
  @user.save
end

Given /^a user exists$/ do
  @user = User.create :email => "user@example.com", :password => "password", :password_confirmation => "password"
end

Given /^an application exists with email "([^"]*)" and name "([^"]*)"$/ do |email, name|
  @user = FactoryGirl.create :user, email: email
  @application = FactoryGirl.create :client_application, email: email, business_name: name, user: @user
end

Given /^I am an authenticated admin user$/ do
  step %(an admin user exists)
  visit root_path
  fill_in('user_email', :with => 'admin@example.com')
  fill_in('user_password', :with => 'password')
  click_on("Sign in")
end

