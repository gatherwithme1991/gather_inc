class AddTokenDigest < ActiveRecord::Migration
  def change
  	add_column :users, :facebook_token_digest, :string
  	remove_column :users, :facebook_token
  end
end
