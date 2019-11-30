class PagesController < ApplicationController
  def index
    ufs = UserFollower.where(user_id: session[:user_id]) #user_id, follower_id
    follower_ids = ufs.map{|u| u.follower_id} # follower_id
    @followers = Follower.where(id: follower_ids)


    if @followers.blank? && current_user.present?
      twitter_response = TwitterAPI.new
      @followers = twitter_response.client(current_user).followers
      @followers.each do |follower|
        f = Follower.find_or_create_by(name: follower.name, user_id: follower.id)
        UserFollower.create(user_id: session[:user_id], follower_id: f.id)
      end
    end
  end
end

