class FollowingRelationship < ActiveRecord::Base
  belongs_to :follower, class_name: 'User'  #overrite with class name
  belongs_to :followed_user, class_name: 'User'
  # attr_accessible :title, :body
end
