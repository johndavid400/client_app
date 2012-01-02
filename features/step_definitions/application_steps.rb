Then /^the application's state should change to "([^"]*)"$/ do |state|
  @application = ClientApplication.last
  @application.application_state.should == "submitted"
end
