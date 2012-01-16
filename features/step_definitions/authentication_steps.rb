Given /^an admin user exists$/ do
  @user = User.create :email => "admin@example.com", :password => "password", :password_confirmation => "password"
  @user.admin = true
  @user.save
end

Given /^a user exists$/ do
  @user = User.create :email => "user@example.com", :password => "password", :password_confirmation => "password"
end

Given /^I am an authenticated admin user$/ do
  step %(an admin user exists)
  visit root_path
  fill_in('user_email', :with => 'admin@example.com')
  fill_in('user_password', :with => 'password')
  click_on("Sign in")
end

Given /^I am an authenticated user$/ do
  step %(an application exists with email "user@example.com" and name "Jerry")
  visit root_path
  fill_in('user_email', :with => 'user@example.com')
  fill_in('user_password', :with => 'password')
  click_on("Sign in")
end

