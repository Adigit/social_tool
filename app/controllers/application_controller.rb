class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def twitter_client(a_token = ENV["admin_access_token"], a_secret = ENV["admin_access_token_secret"])
  	client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["admin_consumer_key"]
      config.consumer_secret     = ENV["admin_consumer_secret"]
      config.access_token        = a_token
      config.access_token_secret = a_secret
    end 
    return client
  end
end
