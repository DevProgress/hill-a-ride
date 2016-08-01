class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.references :event
      t.references :user
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.float :latitude
      t.float :longitude
      t.integer :num_of_seats
      t.integer :num_of_seats_available
      t.datetime :leave
      t.datetime :return
      t.timestamps
    end
  end
end
