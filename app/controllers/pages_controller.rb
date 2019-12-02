class PagesController < ApplicationController
  def index
    ufs = UserFollower.where(user_id: session[:user_id]) #user_id, follower_id
    follower_ids = ufs.map{|u| u.follower_id} # follower_id
    @followers = Follower.where(id: follower_ids)


    if @followers.blank? && current_user.present?
      twitter_response = TwitterAPI.new

      @followers = twitter_response.client(current_user).followers
      flash[:success] = "We are loading your followers, please do not close the browser."
      #begin
        @followers.each do |follower|
          f = Follower.find_or_create_by(name: follower.name, user_id: follower.id)
          UserFollower.create(user_id: current_user.id, follower_id: f.id)
        end
      #rescue Twitter::Error::TooManyRequests => error
      #  puts "#{Time.current} for user_id: {current_user.id} Rate limited, sleeping for #{error.rate_limit.reset_in}"
      #  sleep error.rate_limit.reset_in + 1
      #  retry
      #end
    end
  end
end

