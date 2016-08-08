class CreateRideRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :ride_requests do |t|
      t.references :passenger
      t.references :car
      t.integer :status, default: 0
      t.integer :num_of_seats_requested
      t.text :note
      t.timestamps
    end
  end
end
