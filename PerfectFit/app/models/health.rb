class Health < ActiveRecord::Base
	belongs_to :user

	attr_accessible :user_id, :log_type, :weight, :food, :weight, :BPM, :BP, :BMI, :date, :sleep, :cholesterol



end
