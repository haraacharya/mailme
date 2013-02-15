class MailmemailsController < ApplicationController

	def create
		@user = User.find(params[:user_id])
		@mailmemail = Mailmemail.new(params[:mailmemail])
		@mailmemail.user = current_user
		@mailmemail.sendto = @user.id
		

		if @mailmemail.save
			if Mailmemail.where(:user_id => @user.id, :sendto => current_user.id).first == nil
				UserMailer.mail_confirmation(@mailmemail).deliver
			else
				@mailmemail.bang = true
				@mailmemail.save 
				
				@oldmailmemails = Mailmemail.where(:user_id => current_user.id, :sendto => @user.id)
				@oldmailmemails.each do |oldmailmemail|
					oldmailmemail.bang = true
					oldmailmemail.save
				end

				@oldmailmemailsr = Mailmemail.where(:user_id => @user.id, :sendto => current_user.id)
				@oldmailmemailsr.each do |oldmailmemailr|
					oldmailmemailr.bang = true
					oldmailmemailr.save
				end
				
				@bangfromuser = current_user		
				UserMailer.bang_confirmation(@mailmemail, @bangfromuser).deliver
				
				@bangmail = Mailmemail.where(:user_id => @user.id, :sendto => current_user.id).first
				#send @user details as well
				UserMailer.re_confirmation(@bangmail, @user).deliver
			end		
			redirect_to user_path(@user), notice: "Sent successfully"
		else
			render "users/show"
		end

	end

end	