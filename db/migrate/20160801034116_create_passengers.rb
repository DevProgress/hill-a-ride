class CreatePassengers < ActiveRecord::Migration[5.0]
  def change
    create_table :passengers do |t|
      t.references :event
      t.references :user
      t.string :city
      t.string :state
      t.string :zip_code
      t.float :latitude
      t.float :longitude
      t.integer :seats_requested
      t.integer :seats_still_needed
      t.timestamps
    end
  end
end
