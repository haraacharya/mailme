module ApplicationHelper

	def active(page)
  		return 'class="active"'.html_safe if current_page?(page)
  	end

  	def no_of_mails(user)
		Mailmemail.where(:sendto => user.id).count
	end	

end
