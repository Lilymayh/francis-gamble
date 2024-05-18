class Square
  attr_reader :row, :column, :colour
  attr_accessor :piece

  def initialize(row:, column:, colour:)
    @row = row
    @column = column
    @colour = colour
    @piece = nil
  end
end