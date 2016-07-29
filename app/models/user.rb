class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  after_create :import_facebook_friends

  def self.find_for_oauth(oauth)
    user = User.where(facebook_id: oauth["uid"]).first
    return nil unless user
    user.facebook_token = oauth["credentials"]["token"]
    user.save if user.changed?
    return user
  end

  def self.find_by_oauth_email(oauth)
    User.where(email: oauth['info']["email"]).first
  end

  def set_oauth_data!(oauth)
    self.facebook_id = oauth["uid"]
    self.facebook_token = oauth["credentials"]["token"]
    self.email = oauth["info"]["email"] if self.email.blank?
    self.password = Devise.friendly_token[0,20] if self.new_record?
    self.name = oauth["info"]["name"] if self.name.blank?
    self.photo_url = oauth["info"]["image"]

    User.transaction do
      self.save if self.changed? or self.new_record?
    end

    return (self.persisted? and self.errors.empty?)
  end

  def import_facebook_friends
    #import facebook friends
    data = JSON.parse(api.user_friends(self.id))
    data["data"].each do |friend|
      facebook_friend = FacebookFriend.where(user_id: self.id, facebook_id: friend["id"]).first_or_initialize
      friend_user = User.where(facebook_id: friend["id"]).first
      if friend_user
        facebook_friend.friend_user_id = friend_user.id
        facebook_friend.friend_name = friend_user.name
        friend_user.delay.import_facebook_friends if facebook_friend.new_record?
      else
        facebook_friend.friend_name = friend["name"]
      end
      facebook_friend.save if facebook_friend.new_record? or facebook_friend.changed?
    end
  end
  handle_asynchronously :import_facebook_friends

  private

  def api
    @api ||= FacebookApi.new
  end

end