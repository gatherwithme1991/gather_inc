class DropColumns < ActiveRecord::Migration
  def change
  	remove_column :venues, :event_id
  	remove_column :venues, :who_voted
  	add_column :events, :event_desc, :string
  	add_column :events, :event_datetime, :datetime
  	add_column :events, :is_private, :boolean
  	#add creator_id later for association..
  end
end
