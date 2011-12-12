class Initial < ActionMailer::Base
  default from: "client_application@isotope11.com"

  def initial_email(application)
    @application = application
    @url  = client_application_path(@application)
    mail(:to => "jd@isotope11.com", :subject => "You have received a new client application")
  end
end
