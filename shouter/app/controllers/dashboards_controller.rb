class DashboardsController < ApplicationController
	def show
		@text_shout = TextShout.new
		@photo_shout = PhotoShout.new
		if current_user
			@shouts = current_user.shouts
		end
	end
	def list
		@list_shouts = Shout.all
	end
end