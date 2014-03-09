class UsersController < ApplicationController
  include UsersHelper
  
  def load_main_page
    
  end

  def create
  	@user = User.new(user_params)
    user_email = @user[:email]
  
    @user[:password_digest] = digest(@user[:password_digest])
    if User.find_by(email: user_email.downcase) == nil
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
    
    if user == nil #This user never logged in with fb before
      #Call fb api to generate a token
      @user = User.new(user_params)
      @user[:is_active] = true
      @user[:facebook_token_digest] = digest(@user[:facebook_token_digest])
      if @user.save
        @return_code = 0
        @user_id = user[:id]
        retrieve_initial_user_info(user)
      else
        @return_code = -3
      end
    else
      #This user already logged in with fb
      if authenticate(user_params[:facebook_token_digest], user[:facebook_token_digest])
        retrieve_initial_user_info(user)
        @return_code = 1
      else
        @return_code = -4
      end

    end
     
    
  end

  def login_with_email
    user = User.find_by(email: user_params[:email])
    if user != nil && authenticate(user_params[:password_digest], user[:password_digest]) 
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
                                     :facebook_id, :facebook_token_digest)
    end
end
