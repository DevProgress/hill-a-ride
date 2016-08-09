class AddTypeToEvents < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :latitude, :decimal, :precision => 10, :scale => 7
    change_column :events, :longitude, :decimal, :precision => 10, :scale => 7
    add_column :events, :event_type_id, :integer
    add_index :events, :event_type_id
  end
end
