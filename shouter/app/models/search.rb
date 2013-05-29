class Search
	attr_reader :term
	def initialize options = {} #hash
		@term = options.fetch(:term, "") #fetch the term or "" if no value
	end

	def shouts
		Shout.text_shouts.where(content_id: text_shouts)
	end

	private

	def text_shouts
		TextShout.where("body ilike ?", search_term)
	end

	def search_term
		"%#{term}%"
	end

end