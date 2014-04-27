class Activity < ActiveRecord::Base
	belongs_to :user

	attr_accessible :user_id, :date, :activity_type, :duration, :calories, :distance, :steps, :floors, :laps, :mood, :notes, :hours, :minutes

	attr_accessor :hours
	attr_accessor :minutes 
	attr_accessor :total_time 

	before_save :set_duration


	def set_duration
		total_time = (self.hours.to_i * 60) + self.minutes.to_i
		self.duration = total_time
		distance_of_time_in_hours_and_minutes(Time.now+total_time*60, Time.now)
	end

	def distance_of_time_in_hours_and_minutes(from_time, to_time)
	  from_time = from_time.to_time if from_time.respond_to?(:to_time)
	  to_time = to_time.to_time if to_time.respond_to?(:to_time)
	  dist = to_time - from_time
	  minutes = (dist.abs / 60).round
	  hours = minutes / 60
	  minutes = minutes - (hours * 60)

	  words = dist <= 0 ? '' : '-'

	  words << "#{hours} #{hours > 1 ? 'hours' : 'hour' } and " if hours > 0
	  words << "#{minutes} #{minutes == 1 ? 'minute' : 'minutes' }"

	  self.duration_text = words
	end

end
