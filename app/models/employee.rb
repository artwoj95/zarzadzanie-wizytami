class Employee < ActiveRecord::Base
	belongs_to :user
	has_many :working_hours
	has_many :appointments

	validates :telephone_number, :position, presence: true
  	validates :telephone_number, length: {in: 9..12}
  	validates :telephone_number, numericality: { only_integer: true }
end
