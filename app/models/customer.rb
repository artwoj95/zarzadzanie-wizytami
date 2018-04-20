class Customer < ActiveRecord::Base
	belongs_to :user
	has_many :appointments

	validates :telephone_number, 
        :city, :pesel, presence: true
  validates :telephone_number, length: {in: 9..12}
  validates :pesel, length: {is: 11}
  validates :telephone_number, :pesel, numericality: { only_integer: true }

	def customer_fields
		[first_name, last_name, telephone_number, city, pesel]
	end

	def all_filled?
		customer_fields.compact.size >= customer_fields.size
	end
end
