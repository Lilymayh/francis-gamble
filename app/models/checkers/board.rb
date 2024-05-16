class GameBoard < ApplicationRecord
	has_many :pieces
	has_many :squares
	
	def initalize_board
		(1..8).each do |row|
			(1..8).each do |column|
				squares.create(row: row, column: column)
			end
		end
	endw

end