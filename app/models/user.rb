class User < ActiveRecord::Base
	has_secure_password
	has_many :votes
	validates :name, :email, presence: true
	validates :phone, uniqueness: true, presence: true
	validate :phone, format: { with: \d{3}-\d{3}-\d{4}, message: "try again" }



	def self.test
		puts "no"
	end
end