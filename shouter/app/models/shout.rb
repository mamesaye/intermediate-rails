class Shout < ActiveRecord::Base
  belongs_to :user
  default_scope { order('created_at DESC') } #handle the ordering
  belongs_to :content, polymorphic: true
 # validates :body, presence: true
end
