# app/models/fake_user.rb
class FakeUser < ApplicationRecord
  validates :email, presence: true
  validates :password, presence: true
  validates :balance, numericality: { greater_than_or_equal_to: 0 }
end

