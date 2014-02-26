class FixDatabaseDesign < ActiveRecord::Migration
  def change
  	remove_column :events, :event_datetime
  	remove_column :events, :pictures
  	remove_column :events, :whos_invited
  	remove_column :events, :whos_going
  	remove_column :events, :venues
  	remove_column :events, :event_datetimes
  	remove_column :events, :proposed_movies
  	remove_column :events, :who_brings_what
  	add_column :events, :is_active, :boolean
  	add_column :users, :is_active, :boolean
  end
end
