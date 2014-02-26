class RemoveEmail < ActiveRecord::Migration
  def change
  	remove_column :users, :email
  	add_column :users, :phone_number, :string
  end
end
