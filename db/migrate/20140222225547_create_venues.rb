class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :venue_name
      t.string :venue_coordinates
      t.string :who_voted

      t.timestamps
    end
  end
end
