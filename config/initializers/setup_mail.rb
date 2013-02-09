ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "http://sleepy-lowlands-4295.herokuapp.com",
  :user_name            => "hara.acharya",
  :password             => "Agrima2012@",
  :authentication       => "plain",
  :enable_starttls_auto => true
}