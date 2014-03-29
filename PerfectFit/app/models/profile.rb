class Profile < ActiveRecord::Base
	belongs_to :user

	attr_accessor :user_age

	attr_accessible :first_name, :last_name, :age, :gender, :weight, :zipcode, :birthday, :user_id
end
