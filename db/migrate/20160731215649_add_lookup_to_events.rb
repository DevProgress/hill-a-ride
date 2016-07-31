class AddLookupToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :lookup_id, :string
    execute "ALTER TABLE events CONVERT TO CHARACTER SET utf8mb4;"
  end
end
