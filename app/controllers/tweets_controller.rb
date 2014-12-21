require 'net/http'
require 'social_data'

class TweetsController < ApplicationController
	
	def get_tweets
#=begin
		client = twitter_client()
		keywords = current_user.keywords
		tweets_arr = []
		tweets = client.search(keywords, :since_id => params[:last_tweet_id]).to_h
		
		if !tweets.nil? 
			statuses = tweets[:statuses]
			statuses.each do |status|
				tweets_hash = {}
				tweets_hash["created_at"] = status[:created_at]
				tweets_hash["tweet_id"] = status[:id]
				tweets_hash["text"] = status[:text]
				tweets_hash["tweet_user_id"] = status[:user][:id]
				tweets_hash["tweet_user_name"] = status[:user][:name]
				tweets_hash["tweet_user_screen_name"] = status[:user][:screen_name]
				tweets_hash["tweet_user_profile_img"] = status[:user][:profile_image_url]
				tweets_hash["keywords"] = keywords
				tweets_arr << tweets_hash
			end
		end
		logger.error ">>>>> tweets_arr >>> #{tweets_arr}"
		repository = SocialData.new log: true
		tweets_arr.each do |twr|
			t = Tweet.new created_at: twr["created_at"], tweet_id: twr["tweet_id"], text: twr["text"], tweet_user_id: twr["tweet_user_id"], tweet_user_name: twr["tweet_user_name"], tweet_user_screen_name: twr["tweet_user_screen_name"], tweet_user_profile_img: twr["tweet_user_profile_img"], keywords: twr["keywords"]
			repository.save(t)
		end
#=end
	end
	
end
