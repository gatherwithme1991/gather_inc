class UsersController < ApplicationController
  include UsersHelper
  
  def load_main_page
    
  end

  def create
  	@user = User.new(user_params)
    user_email = @user[:email]
  
    if User.find_by(email: user_email.downcase) == nil
      @user[:password_digest] = digest(@user[:password_digest])
      @remember_token = new_remember_token()
      @user[:remember_token_digest] = digest(@remember_token)
      @user[:is_active] = true
      if @user.save
        #Make sure you add a profile pic path (might wanna use mkdir)
        @return_code = 0
        @user_id = @user[:id]
      else
        @return_code = -1
      end
    else 
      @return_code = -2
    end
  end

  def login_with_facebook
  	# Get email and password and fetch necessary information
    user = User.find_by(facebook_id: user_params[:facebook_id])
    #Call fb api to generate a token on the client side
    #Authenticate this token    
    if user == nil 
      #This user never logged in with fb before
      @user = User.new(user_params)
      @user[:is_active] = true
      @remember_token = new_remember_token()
      @user[:remember_token_digest] = digest(@remember_token)
      if @user.save
        @return_code = 0
        @user_id = @user[:id]
        retrieve_initial_user_info(user)
      else
        @return_code = -3
      end
    else
      #This user already has logged in with fb
      retrieve_initial_user_info(user)
      @remember_token = new_remember_token()
      user[:remember_token_digest] = digest(@remember_token)
      user.save
      @user_id = user[:id]
      @return_code = 0
      
    end
     
    
  end

  def login_with_email
    user = User.find_by(email: user_params[:email])
    if user != nil && authenticate(user_params[:password_digest], user[:password_digest])
      @remember_token = new_remember_token()
      user[:remember_token_digest] = digest(@remember_token)
      user.save 
      @return_code = 0
      @user_id = user[:id]
      retrieve_initial_user_info(user)
    else
      @return_code = -1
    end
  end

 
  def logout
  	# Get email and destroy the remember token of the user
  end


  private

  	def user_params
      	params.require(:user).permit(:name, :last_name, :email, :password_digest,
                                     :facebook_id, :facebook_token)
    end
end
