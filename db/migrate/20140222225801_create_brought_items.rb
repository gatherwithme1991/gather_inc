class CreateBroughtItems < ActiveRecord::Migration
  def change
    create_table :brought_items do |t|
      t.integer :bringer
      t.string :item

      t.timestamps
    end
  end
end
