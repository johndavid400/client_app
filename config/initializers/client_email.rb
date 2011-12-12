ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => 'gmail.com',
  :user_name            => 'isotope.eleven@gmail.com',
  :password             => 'boobies11',
  :authentication       => 'plain',
  :enable_starttls_auto => true
}
