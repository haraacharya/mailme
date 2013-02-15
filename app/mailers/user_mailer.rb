class UserMailer < ActionMailer::Base
  default from: "donotrespond.mailme@gmail.com"
  
  def mail_confirmation(mailmemail)
  	@mailmemail = mailmemail
  	emailto = User.find(mailmemail.sendto).email
  	mail(:to => emailto, :subject => mailmemail.subject)
  end

  def bang_confirmation(mailmemail, user)
  	@user = user
  	@mailmemail = mailmemail
  	emailto = User.find(mailmemail.sendto).email
  	mail(:to => emailto, :subject => mailmemail.subject)
  end

  def re_confirmation(mailmemail, user)
  	@user = user
  	@mailmemail = mailmemail
  	emailto = User.find(mailmemail.sendto).email
  	mail(:to => emailto, :subject => mailmemail.subject)
  end

end
