require 'social_data'
class HomeController < ApplicationController
  	layout "bootstrap_layout"
  	def index
  		repository = SocialData.new
	  	if current_user
		  	keywords = current_user.keywords 
		  	@tweets = repository.search(query: {match: {keywords: keywords}}, size:200).to_a
	  	end
  	end
end
