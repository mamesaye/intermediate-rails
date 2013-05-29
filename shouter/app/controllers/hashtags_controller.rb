class HashtagsController < ApplicationController
	def show
		#'nil' is not an ActiveModel-compatible object that returns a valid partial path. 
		# ie need an object
		@hashtag = params[:id]
		#@shouts = Shout.search(@hashtag) #find all the shout with that word
		@shouts = Shout.search("##{@hashtag}") # find the links i
	end	
end