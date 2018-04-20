class UserMailer < ApplicationMailer
	default from: 'appointments@gmail.com'

	def accepted_appointment(customer, appointment)
		@customer = customer
		@user = User.find(@customer.user_id)
		@appointment = appointment
		@employee = Employee.find(@appointment.employee_id)
		mail(to: @user.email, subject: 'Your appointment has beed accepted')
	end

	def declined_appointment(customer, appointment)
		@customer = customer
		@user = User.find(@customer.user_id)
		@appointment = appointment
		@employee = Employee.find(@appointment.employee_id)
		mail(to: @user.email, subject: 'Your appointment has beed declined')
	end
end
