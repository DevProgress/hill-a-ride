class RemoveColumnsFromFacebookFriends < ActiveRecord::Migration[5.0]
  def change
    remove_column :facebook_friends, :friend_name
    remove_column :facebook_friends, :city
    remove_column :facebook_friends, :state
    add_index :facebook_friends, :friend_user_id
    add_index :users, :state
  end
end
