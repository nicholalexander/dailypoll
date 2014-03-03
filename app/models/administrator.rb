class Administrator < ActiveRecord::Base
	has_secure_password

	def self.test
		puts "yes"
	end
end