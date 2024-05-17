class Piece < ApplicationRecord
  belongs_to :square


  def update_piece
    if (color == "red" && square.row == 8) || (color == "black" && square.row == 1)
      update(king: true)
    end
  end

  def valid_move?(source_square, destination_square)
    #Set the direction
    direction = (color == "red") ? 1 : -1

    #Both directions have the same absolute value
    row_diff = (destination_square.row - source_square.row).abs
    col_diff = (destination_square.column - source_square.column).abs
    #Should be one less than the value of the destination square
    captured_row = (source_square.row + destination_square.row) / 2
    captured_col = (source_square.column + destination_square.column) / 2

    return false if destination_square.piece.present?
    return false if self.square == destination_square
    return false if !king? && (direction * (destination_square.row - source_square.row)) <= 0
    return false if (row_diff != 2 || col_diff != 2) && (captured_row != 1 || captured_col != 1)

    true
  end
end