class DashboardsController < ApplicationController
	def show
		@dashboard = Dashboard.new(current_user) 
		#dashboard ctller (single declaration) retrieve timeline and timeline retrieve shout 
		# => single responsability principle (extensive classes)
	end
end