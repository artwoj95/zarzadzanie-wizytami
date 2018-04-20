module HomeHelper


	def first_name?(user)
		if !user
			""
		else
			user.first_name
		end
	end

	def last_name?(user)
		if !user
			""
		else
			user.last_name
		end
	end

	def who_to_show?(user)
		if user.customer?
			unless user.customer.nil?
			customer_path(user.customer)
			end
		elsif user.employee?
			unless user.employee.nil?
			employee_path(user.employee)
			end
		elsif user.secretary?
			unless user.secretary.nil?
			secretary_path(user.secretary)
			end
		elsif user.admin?
			admin_user_user_list_path(user)
		end	
	end

end
