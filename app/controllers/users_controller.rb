class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@mailmemails = Mailmemail.where(:sendto => @user.id)
		@mailmemail = Mailmemail.new
	end

end