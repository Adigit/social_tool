class MyClass
	
	attr_reader	:attributes
	
	def initialize(attribute = {})
		@attributes = attributes
	end
	
	def to_hash
		@attributes
	end
	
end