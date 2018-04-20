class WorkingHour < ActiveRecord::Base
	belongs_to :employee

	validates :day, :start_hour, :end_hour, presence: true
	validates :day, uniqueness: {scope: :employee ,message: ": You already set working hours for %{value}"}
	validate :correct_working_hours

	private

	def correct_working_hours
		if(start_hour[0..1].to_f >= end_hour[0..1].to_f && end_hour[3..4] != '30')
			errors.add(:start_hour, "is greater than end hour")
		end
	end

	

end
