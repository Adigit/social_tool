class TweetsController < ApplicationController
	
	def get_tweets
		client = twitter_client()
		tweets = client.search(current_user.keywords)
		logger.error ">>>> tweets >>>> #{tweets.to_h}"
		render :nothing => true
	end
	
end
