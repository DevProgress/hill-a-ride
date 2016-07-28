class FacebookApi
  include HTTParty
  base_uri "https://graph.facebook.com"
  headers "Content-Type" => "application/json"

  def user_friends(user_id)
    user = User.find(user_id)
    return nil if user.nil?
    self.class.get("/#{user.facebook_id}/friends?access_token=#{user.facebook_token}")
  end

  def user_picture(user_id)
    user = User.find(user_id)
    return nil if user.nil?
    self.class.get("/#{user.facebook_id}/picture?access_token=#{user.facebook_token}")
  end

end