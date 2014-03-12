class User < ActiveRecord::Base
  attr_accessor :facebook_token
  before_save { 
  	if self.email != nil 
  		self.email = email.downcase 
  	end
  }

  has_many :friendships, foreign_key: "user_id", dependent: :destroy
  has_many :friendships, foreign_key: "friend_id", dependent: :destroy


  

end
