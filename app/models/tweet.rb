class Tweet
#  include Mongoid::Document
 	attr_reader	:attributes
	
	def initialize(attributes = {})
		@attributes = attributes
	end
	
	def to_hash
		@attributes
	end
end
