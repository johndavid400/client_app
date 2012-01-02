Given /^an admin user exists$/ do
  @user = User.create :email => "admin@example.com", :password => "password", :password_confirmation => "password"
  @user.admin = true
  @user.save
end

Given /^a user exists$/ do
  @user = User.create :email => "user@example.com", :password => "password", :password_confirmation => "password"
end

Given /^an application exists with email "([^"]*)"$/ do |email|
  @application = ClientApplication.create(:email => email, :business_name => "Testico")
  @application.submit!
  @user = User.new(:email => @application.email, :password => "password", :password_confirmation => "password")
  @user.save
  @application.update_attributes(:user_id => @user.id)
end

