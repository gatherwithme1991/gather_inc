class UsersController < ApplicationController
  
  def create
  	@user = User.new(user_params)
    if @user.save
    	@return_code = 0
    else
    	@return_code = -1
    end
  end

  def show
  	puts "User show request"
  end

  private

  	def user_params
      	params.require(:user).permit(:name, :last_name, :email, :password,
                                   :password_confirmation)
    end
end
