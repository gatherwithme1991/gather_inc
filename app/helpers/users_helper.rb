module UsersHelper

	def retrieve_initial_user_info(user)
		puts "Function called!"
	end

	def digest(digested)
		return Digest::SHA1.hexdigest(digested)
	end

	def authenticate(authenticated, digested)
		return Digest::SHA1.hexdigest(authenticated) == digested
	end

    def new_remember_token
    	return SecureRandom.urlsafe_base64
    end

end
