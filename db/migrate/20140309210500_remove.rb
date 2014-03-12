class Remove < ActiveRecord::Migration
  def change
  	remove_column :users, :facebook_token_digest
  end
end
