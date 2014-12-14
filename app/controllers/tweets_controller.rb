require 'net/http'
class TweetsController < ApplicationController
	
	def get_tweets
		client = twitter_client()
		#tweets = client.search(current_user.keywords)
		url = URI.parse('http://127.0.0.1:9200/social_data/tweets/1')
		req = Net::HTTP::Get.new(url.to_s)
		res = Net::HTTP.start(url.host, url.port) {|http|
  			http.request(req)
		}
		#http = Net::HTTP.new(url.host, url.port)
		#req = Net::HTTP::GET.new(url.request_uri)
		#req.set_form_data({"tweet" => "Hello guys"})
		#logger.error ">>>>  req >>>>> #{req}"
		#response = http.request(req)
		logger.error ">>>> tweets >>>> #{res.body}"
		render :nothing => true
	end
	
end
