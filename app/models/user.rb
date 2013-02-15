class User < ActiveRecord::Base
	attr_accessible :email, :name
	has_many :mailmemails
	def self.from_omniauth(auth)
		where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
			user.provider = auth.provider
			user.uid = auth.uid
			user.email = auth.info.email
			user.name = auth.info.name
			user.first_name = auth.info.first_name
			user.last_name = auth.info.last_name
			user.image = auth.info.image
			user.urls = auth.info.urls.Facebook
			user.location = auth.info.location
			user.verified = auth.info.verified
			user.gender = auth.extra.raw_info.gender
			user.save!
		end
	end

end