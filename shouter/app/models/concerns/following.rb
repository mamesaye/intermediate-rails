module Concerns
	module Following

		extend ActiveSupport::Concern
		#1- evaluate a block in the scope of the class
		include do
			#move model user code here
			
 		end

		def following? user
			followed_user_ids.include? user.id
		end

		def can_follow? user  # hide foolow button on our page
			self != user
		end

		# for controller
		def follow user
			followed_users << user
		end

		def unfollow user
			followed_users.delete(user)
		end
 		

 			#2- create module for class methods 
 			#for methods that can be added to the class itself rather tha instance method
 			#module ClassMethods
 				# example add a particuler scope like show all the user with followers
 				#def with_followers
 				#	where (...)
 				#end

 			#end
		
	end
end