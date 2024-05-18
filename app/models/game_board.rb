class GameBoard
	attr_reader :squares

  def initialize
    @squares = []
    initialize_board
  end

  private
	
	def initialize_board
		(1..8).each do |row|
			(1..8).each do |column|
        colour = (row + column).even? ? "black-square" : "white-square"
        square = Square.new(row: row, column: column, colour: colour) 
				if row <= 3 && colour == "black-square"
          piece = Piece.new("red")
          piece.square = square
          square.piece = piece
        elsif row >= 6 && colour == "black-square"
          piece = Piece.new("black")
          piece.square = square
          square.piece = piece
        end
				@squares << square
			end
		end
	end
end
