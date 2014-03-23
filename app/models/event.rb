class Event < ActiveRecord::Base
	belongs_to :user, class_name: "User"
	
	default_scope -> { order('created_at DESC') }
	validates :creator_id, presence: true
	validates :event_name, presence: true, length: { maximum: 140 }
end
