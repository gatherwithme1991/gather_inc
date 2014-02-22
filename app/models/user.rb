class User < ActiveRecord::Base
  attr_accessor :remember_token_pure

  has_many :friendships, foreign_key: "user_id", dependent: :destroy
  has_many :friendships, foreign_key: "friend_id", dependent: :destroy

  before_save { self.email = email.downcase }
  before_create :create_remember_token
  validates :name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }

  def User.new_remember_token
  	SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
  	def create_remember_token
      new_remember_token = User.new_remember_token
  		self.remember_token = User.encrypt(new_remember_token)
      self.remember_token_pure = new_remember_token
  	end
end
