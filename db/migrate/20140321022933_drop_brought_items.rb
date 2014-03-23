class DropBroughtItems < ActiveRecord::Migration
  def change
  	drop_table :brought_items
  end
end
