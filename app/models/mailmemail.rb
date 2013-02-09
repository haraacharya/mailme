class Mailmemail < ActiveRecord::Base
	attr_accessible :to_user_id, :subject, :content
	validates :content, presence: true
	belongs_to :user
end