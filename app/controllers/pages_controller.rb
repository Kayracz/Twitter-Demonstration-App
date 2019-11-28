class PagesController < ApplicationController
  def index
    twitter_response = TwitterAPI.new
    @followers ||= twitter_response.client.followers

    @followers.find(10).each do |follower|
    Follower.create(name: follower.name)
    end


    # User have many followers
    # Follower have many users
    # rails g model Follower name:string

    # USserFollower join table
    # rails g model UserFollower user:references follower:references
    # @followers = UserFollower.find(user: current_user).followers
  end
end
