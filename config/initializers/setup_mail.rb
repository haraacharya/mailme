ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "http://mailme-nosreves.herokuapp.com",
  :user_name            => "donotreply.mailme@gmail.com",
  :password             => "******",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
