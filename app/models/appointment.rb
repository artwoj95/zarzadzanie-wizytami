class Appointment < ActiveRecord::Base
	belongs_to :user
	belongs_to :employee
	belongs_to :customer

	validates :purpose, :extra, :appointment_date, :appointment_time, presence: true
	#validates :appointment_time, uniqueness: {scope: [:employee_id, :appointment_date] }
	validate :already_confirmed

	private

		def already_confirmed
			other_appointments = Appointment.where(
	                             appointment_date: self.appointment_date,
	                             appointment_time: self.appointment_time,
	                             employee_id: self.employee_id,
	                             confirmation: true
	                           ) 
	      unless other_appointments.empty?
	        [:appointment_date].each do |attr|
	          errors.add(attr,"is not available")
	        end
	      end       
	    end
end
