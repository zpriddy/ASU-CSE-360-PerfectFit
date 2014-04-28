class Profile < ActiveRecord::Base
	belongs_to :user

	attr_accessor :user_age

	attr_accessible :first_name, :last_name, :age, :gender, :weight, :zipcode, :birthday, :user_id, :time_zone, :height, :inches, :feet

	validates_inclusion_of :time_zone, in: ActiveSupport::TimeZone.zones_map(&:name)

	attr_accessor :feet
	attr_accessor :inches 
	#attr_accessor :total_height
	attr_accessor :total_bmi

	before_save :set_height, :if => lambda{ self.feet.to_i > 0 || self.inches.to_i > 0}
	


	def set_height
		total_height = (self.feet.to_i * 12) + self.inches.to_i
		self.height = total_height
		
	end


end
#ADD