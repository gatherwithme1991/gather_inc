class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      
      t.string :event_name
	  t.datetime :event_datetime
	  t.string :event_type
	  t.string :pictures #absolute path to directories
	  t.integer :venue 
	  t.string :whos_invited
	  t.string :whos_going
	  t.string :proposed_venues
	  t.string :proposed_event_datetimes
	  t.string :proposed_movies
	  t.string :who_brings_what
      
      t.timestamps
    end
  end
end
