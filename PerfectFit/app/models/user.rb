class User < ActiveRecord::Base
	has_one :profile
	has_many :activities

	accepts_nested_attributes_for :profile

	attr_accessor :updating_password
	attr_accessor :user_first_name
	attr_accessor :display_time
	attr_accessor :send_welcome_email

	attr_accessible :email, :password, :password_confirmation, :profile_attributes

	before_save { self.email = email.downcase }
	before_create { generate_token(:auth_token) }
	  
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

	def user_has_first_name?
		self.profile 
	end

	def send_welcome_message
		UserMailer.welcome_message(self, self.profile).deliver
	end
	

	def send_password_reset
	  generate_token(:password_reset_token)
	  self.password_reset_sent_at = Time.zone.now
	  save!
	  UserMailer.password_reset(self).deliver
	end

	def generate_token(column)
	  begin
	    self[column] = SecureRandom.urlsafe_base64
	  end while User.exists?(column => self[column])
	end




	def chart_data(start = @display_time)
	  total_calories = calories_by_day(start)
	  (start.to_date..Date.today).map do |date|
	    {
	      date: date,
	      calories: total_calories[date] || 0,
	    }
	  end
	end

	def calories_by_day(start)
	  self.activities.where(date: start.beginning_of_day..Time.zone.now ).group("date(date)").select("date, sum(calories) as total_calories").each_with_object({}) do |activities, calories|
	    calories[activities.date.to_date] = activities.total_calories
	 end


end
end
