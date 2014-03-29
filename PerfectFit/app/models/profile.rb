class Profile < ActiveRecord::Base
	belongs_to :user

	attr_accessor :user_age

	attr_accessible :first_name, :last_name, :age, :gender, :weight, :zipcode, :birthday, :user_id, :time_zone

	validates_inclusion_of :time_zone, in: ActiveSupport::TimeZone.zones_map(&:name)
end
