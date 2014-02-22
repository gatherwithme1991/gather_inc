class AddBasicInfoToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :password, :string
  	add_column :users, :password_confirmation, :string
  end
end
