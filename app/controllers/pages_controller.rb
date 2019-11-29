class PagesController < ApplicationController
  def index
    ufs = UserFollower.where(user_id: session[:user_id]) #user_id, follower_id
    follower_ids = ufs.map{|u| u.follower_id} # follower_id
    @followers = Follower.where(id: follower_ids)

    puts 'followers before API', @followers, @followers.blank?
    if @followers.blank?
      twitter_response = TwitterAPI.new
      @followers ||= twitter_response.client.followers
      puts 'after API call', @followers
      @followers.each do |follower|
        f = Follower.find_or_create_by(name: follower.name, user_id: follower.id)
        UserFollower.create(user_id: session[:user_id], follower_id: f.id)
      end
    end
  end
end

