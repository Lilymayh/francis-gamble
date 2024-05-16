class Square < ApplicationRecord
  belongs_to :board
  has_one :piece
end