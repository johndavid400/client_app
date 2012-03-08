class Client < ActionMailer::Base
  default from: "client_application@isotope11.com"

  def client_email(application)
    @client_application = application
    @url = client_application_path(@client_application)
    mail(:to => @client_application.email, :subject => "Correspondence with Isotope11")
    mail(:to => "clientapp@isotope11.com", :subject => "A client has submitted information to Isotope11.")
  end

  def isotope_email(application)
    @client_application = application
    mail(:to => "clientapp@isotope11.com", :subject => "A client has submitted information to Isotope11.")
  end

  def completed_email(application)
    @client_application = application
    mail(:to => "clientapp@isotope11.com", :subject => "A client has completed their application.")
    mail(:to => @client_application.email, :subject => "You have completed your application with Isotope11.")
  end
end
