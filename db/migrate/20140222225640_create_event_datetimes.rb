class CreateEventDatetimes < ActiveRecord::Migration
  def change
    create_table :event_datetimes do |t|
      t.datetime :event_datetime
      t.string :who_voted

      t.timestamps
    end
  end
end
