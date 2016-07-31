class AddFriendsCount < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :friends_count, :integer, null: false, default: 0
    add_column :users, :last_friends_count, :datetime
  end
end
