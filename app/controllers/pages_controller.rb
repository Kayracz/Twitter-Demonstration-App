class PagesController < ApplicationController
  def index
    ufs = UserFollower.where(user_id: session[:user_id]) #user_id, follower_id
    follower_ids = ufs.map{|u| u.follower_id} # follower_id
    @followers = Follower.where(id: follower_ids)

    if @followers.blank?
      twitter_response = TwitterAPI.new
      @followers ||= twitter_response.client.followers
      @followers.each do |follower|
        f = Follower.find_or_create_by(name: follower.name, user_id: follower.id)
        UserFollower.create(user_id: session[:user_id], follower_id: f.id)
      end
    end

    # User have many followers
    # Follower have many users
    # rails g model Follower name:string

    # USserFollower join table
    # rails g model UserFollower user:references follower:references
    # @followers = UserFollower.find(user: current_user).followers
  end
end
