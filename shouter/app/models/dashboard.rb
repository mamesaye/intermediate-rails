class Dashboard
	def initialize user
		@user = user
	end

	def new_text_shout
		TextShout.new
	end

	def new_photo_shout
		PhotoShout.new
	end

	def timeline
		Timeline.new(@user) 
		#have to create timeline object in models bc(uninitialized constant Dashboard::Timeline)
		#@user.shouts
	end
end