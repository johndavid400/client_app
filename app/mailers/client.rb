class Client < ActionMailer::Base
  default from: "client_application@isotope11.com"

  def client_email(application)
    @application = application
    @url = client_application_path(@application)
    mail(:to => @application.email, :subject => "Correspondence with Isotope11")
  end

  def isotope_email(application)
    @application = application
    mail(:to => "jd@isotope11.com", :subject => "A client has submitted information to Isotope11.")
  end

  def completed_email(application)
    @application = application
    mail(:to => "jd@isotope11.com", :subject => "A client has completed their application.")
    mail(:to => @application.email, :subject => "You have completed your application with Isotope11.")
  end
end
