class FixUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :new
  	remove_column :users, :remember_token
  	remove_column :users, :going
  	remove_column :users, :invited
  	remove_column :users, :phone_number
  	add_column :users, :email, :string
  	add_column :users, :facebook_id, :string
  	add_column :users, :active, :boolean
  	add_column :users, :profile_pic_path, :string
  end
end
