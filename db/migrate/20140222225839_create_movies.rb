class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :movie_name
      t.string :who_voted

      t.timestamps
    end
  end
end
