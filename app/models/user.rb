class User < ActiveRecord::Base
	has_secure_password
	has_many :votes
	validates :name, :email, presence: true
	validates :phone, uniqueness: true, presence: true
	validates :phone, format: { with: /\d{10}/, message: "Phone not valid" }
end

