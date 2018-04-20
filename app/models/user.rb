class User < ActiveRecord::Base
	self.inheritance_column = nil

  enum type: {employee: 'employee', secretary: 'secretary', customer: 'customer', admin: 'admin'}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, :last_name, presence: true

  has_one :customer
  has_one :employee
  has_one :secretary
  has_many :appointments

  def admin?
  	type == "admin"
  end
end
