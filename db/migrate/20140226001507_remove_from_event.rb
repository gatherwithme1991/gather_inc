class RemoveFromEvent < ActiveRecord::Migration
  def change
  	remove_column :events, :venue
  	remove_column :events, :proposed_venues
  	remove_column :events, :proposed_event_datetimes
  end
end
