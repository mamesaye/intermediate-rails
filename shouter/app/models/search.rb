class Search
	attr_reader :term
	def initialize options = {} #hash
		@term = options.fetch(:term, "") #fetch the term or "" if no value
	end
	def shouts
		Shout.search(term)
	end
end