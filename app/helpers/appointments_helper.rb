module AppointmentsHelper

	def wait_or_confirmed?(value)
		if value == "Waiting"
			false
		elsif value == "Confirmed"
			true
		end
	end

	def go_back(user, status)
		if user.customer?
			appointments_path
		elsif user.employee?
			employee_calendar_path(user.employee)
		elsif user.secretary?
			secretary_calendar_path(user.secretary, status)
		elsif user.admin?
			admin_user_user_list_path(user)		
		end
	end

end
