class SocialData
	include Elasticsearch::Persistence::Repository

	def initialize(options = {})
		index options[:index] || 'social_data'
		client Elasticsearch::Client.new url: options[:url] || 'http://localhost:9200', log: options[:log]
	end

	klass Tweet

	settings number_of_shards: 1 do
	    mapping do
	      indexes :text,  analyzer: 'snowball'
	      # Do not index images
	     # indexes :image, index: 'no'
	    end
	end

end