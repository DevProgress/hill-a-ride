class AddDestinationAddress < ActiveRecord::Migration[5.0]
  def change
      add_column :cars, :destination_address, :string
      add_column :cars, :destination_city, :string
      add_column :cars, :destination_state, :string
      add_column :cars, :destination_zip_code, :string
      change_column :cars, :longitude, :decimal, :precision => 10, :scale => 7
      change_column :cars, :latitude, :decimal, :precision => 10, :scale => 7
      change_column :passengers, :longitude, :decimal, :precision => 10, :scale => 7
      change_column :passengers, :latitude, :decimal, :precision => 10, :scale => 7
  end
end
