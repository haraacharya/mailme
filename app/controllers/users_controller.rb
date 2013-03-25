class UsersController < ApplicationController

	def index
		@users = User.search(params[:search]).paginate(:per_page => 1, :page => params[:page])
	end

	def show
		@user = User.find(params[:id])
		@mailmemails = Mailmemail.where(:sendto => @user.id).order("created_at desc")
		@mailmemail = Mailmemail.new
	end

end