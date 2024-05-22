class User < ApplicationRecord
	self.table_name = "fake_users"
	has_secure_password

	validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  # validates :username, presence: true

	  # Model attributes
		# attribute :username, :string
		# attribute :password, :string
		# attribute :email, :string
		# attribute :registration_date, :datetime
		# attribute :balance, :decimal, precision: 10, scale: 2
end
