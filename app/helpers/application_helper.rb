module ApplicationHelper
	def access_link(curent_user)
		if curent_user
			link_to "Sign Out", destroy_user_session_url , :method => :delete
		else
			link_to("Sign In", new_user_session_url) + " Or " + link_to("Sign Up", new_user_registration_url)
		end
	end
	def acknowledge(curent_user)
		if current_user
			current_user.email 
		else
			"Friend"
		end
	end
end
