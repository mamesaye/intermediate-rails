class Shout < ActiveRecord::Base
  belongs_to :user
  default_scope { order('created_at DESC') } #handle the ordering
  belongs_to :content, polymorphic: true
 # validates :body, presence: true


 def self.search term
 	text_shouts = TextShout.where("body ilike ?", "%#{term}%")
 	where(content_type: 'TextShout', content_id: text_shouts)
 end
end
