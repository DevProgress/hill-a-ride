class CreateFacebookFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :facebook_friends do |t|
      t.references :user
      t.string :facebook_id
      t.integer :friend_user_id
      t.string :friend_name
      t.string :city
      t.string :state
      t.timestamps
    end
  end
end
