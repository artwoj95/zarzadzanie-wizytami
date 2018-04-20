module CustomerHelper

	def employee_first_name(employee)
		return User.find(employee.user_id).first_name
	end

	def employee_last_name(employee)
		return User.find(employee.user_id).last_name
	end
end
