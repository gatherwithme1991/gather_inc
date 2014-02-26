class AddEventInfoToUser < ActiveRecord::Migration
  def change
  	add_column :users, :going, :string #comma delimited event ids
  	add_column :users, :invited, :string #comma delimited event ids
  end
end
