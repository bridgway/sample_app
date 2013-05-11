class Micropost < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC') } #proc nb the special syntax
	validates :content, presence: true, length: { maximum: 140 }
	validates :user_id, presence: true
end
