class Timeline
	extend ActiveModel::Naming  #return a valid partial path OR def to_partial_path

	def initialize user
		@user = user
	end

	#create function bc (is not an ActiveModel-compatible object that returns a valid partial path)
	#def to_partial_path
	#	"timelines/timeline"
	#end
	# OR extend ActiveModel::Naming

	#refactoring @user.shouts(undefined method `shouts' for #<Timeline:0xaf44994>)
	def shouts
		#print shouts of all the people i am following and mine
		#select * from shouts where user_id in (all followed user id + mine)
		#@user.shouts + Shout.where(user_id: @user.followed_user_ids) 

		#rewrite it
		#Shout.where(user_id: @user.followed_user_ids + [@user.id])

		#create a private method to make rewrite more readable
		Shout.where(user_id:shout_user_ids)
	end

	private
	#use extract methode path to increase readability
	def shout_user_ids
		[@user.id] + @user.followed_user_ids
	end
end