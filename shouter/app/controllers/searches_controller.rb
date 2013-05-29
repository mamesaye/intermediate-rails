class SearchesController < ApplicationController
	def show
	#@search =  Search.new(term: params[:term]) 
	@search =  Search.new(params[:search])
	end
end