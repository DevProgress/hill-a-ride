class FacebookFriend < ApplicationRecord
  has_many :users, foreign_key: "friend_user_id"
end
