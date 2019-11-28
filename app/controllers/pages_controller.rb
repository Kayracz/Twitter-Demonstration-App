




class PagesController < ApplicationController
  def index
    twitter_response = TwitterAPI.new
    @followers = twitter_response.client.followers
  end
end
