class FixHelperTable < ActiveRecord::Migration
  def change
  	add_column :venues, :event_id, :integer
  	add_column :venues, :is_final, :boolean

  	add_column :event_datetimes, :event_id, :integer
  	add_column :event_datetimes, :is_final, :boolean

  	add_column :brought_items, :event_id, :integer
  	
  	add_column :movies, :event_id, :integer
  	add_column :movies, :is_final, :boolean
  end
end
