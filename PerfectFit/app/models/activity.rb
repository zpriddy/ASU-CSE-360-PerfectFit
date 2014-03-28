class Activity < ActiveRecord::Base
	belongs_to :user

	attr_accessible :user_id, :date, :activity_type, :duration, :calories, :distance, :steps, :floors, :laps, :mood, :notes



end
