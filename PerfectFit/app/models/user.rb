class User < ActiveRecord::Base
	has_one :profile

	accepts_nested_attributes_for :profile

	attr_accessor :updating_password

	attr_accessible :email, :password, :password_confirmation, :profile_attributes

	before_save { self.email = email.downcase }
	  
	validates_uniqueness_of :email, :if => :should_validate_password?
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence:   true,
	                    format:     { with: VALID_EMAIL_REGEX },
	                    uniqueness: { case_sensitive: false }, :if => :should_validate_password?
	has_secure_password
	validates :password, length: { minimum: 6 }, :if => :should_validate_password?

	def should_validate_password?
  		updating_password || new_record?
	end
end
