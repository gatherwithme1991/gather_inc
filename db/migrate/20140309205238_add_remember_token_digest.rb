class AddRememberTokenDigest < ActiveRecord::Migration
  def change
  	remove_column :users, :remember_token
  	add_column :users, :remember_token_digest, :string
  end
end
