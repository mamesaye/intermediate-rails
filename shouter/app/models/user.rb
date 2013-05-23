class User < ActiveRecord::Base
 	has_many :shouts 

 	#has_many :following_relationships
 	#select * from following_relationships where id = ? (follower)
 	#following_relationships => follower_id followed_user_id
 	#overide the foreign key id with follower_id
 	#has_many :following_relationships, foreign_key: :follower_id
 	#select * from following_relationships where follower_id = ? (me)

 	has_many :followed_user_relationships, 
 		foreign_key: :follower_id, 
 		class_name: 'FollowingRelationship'

 	has_many :followed_users, through: :followed_user_relationships

 	has_many :follower_relationships, 
 		foreign_key: :followed_user_id, 
 		class_name: 'FollowingRelationship'

 	has_many :followers, through: :follower_relationships

#
#following_relationships
#follower_id followed_user_id
#1			3
#select * from following_relationships where follower_id = ?  #follower_ids
#select * from users where id in (?) #follower_ids

	def following? user
		followed_user_ids.include? user.id
	end
# for controller
	def follow user
		followed_users << user
	end

	def unfollow user
		followed_users.delete(user)
	end

end
