class User < ApplicationRecord

	  # Model attributes
		attribute :username, :string
		attribute :password, :string
		attribute :email, :string
		attribute :registration_date, :datetime
		attribute :balance, :decimal, precision: 10, scale: 2
end
