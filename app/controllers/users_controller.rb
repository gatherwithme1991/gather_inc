class UsersController < ApplicationController
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  PASSWORD_MIN_LENGTH = 6		
  
  def create
  	@user = User.new(user_params)
    if @user.save
    	@return_code = 0
    else
    	# Return code depending on the error
    	if !(user_params[:password].eql? user_params[:password_confirmation])
    		@return_code = -1
    	elsif (user_params[:email] =~ VALID_EMAIL_REGEX) != 0
    		@return_code = -2
    	elsif user_params[:password].length < PASSWORD_MIN_LENGTH
    		@return_code = -3
        elsif user_params[:name].length == 0 || user_params[:last_name].length == 0
        	@return_code = -4
        elsif User.find_by(email: user_params[:email].downcase)
        	@return_code = -5
        	
  		end  		
    end
  end

  def login
  	# Get email and password and fetch necessary information
  end

 
  def logout
  	# Get email and destroy the remember token of the user
  end


  private

  	def user_params
      	params.require(:user).permit(:name, :last_name, :email, :password,
                                   :password_confirmation)
    end
end
