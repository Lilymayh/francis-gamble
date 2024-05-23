class Tictactoe < ApplicationRecord

  serialize :board, Array

  after_save :update_winnings

  def update_winnings
    if game_over? && who_won? == "X"
      current_user = User.last
      current_user.balance = current_user.balance + (bet_amount * 2)
      current_user.save
    end
  end

  def make_player_move(index)

    return false if board[index].present? || game_over?



    board[index] = 'X'

    make_opponent_move unless game_over?

    save

  end



  def make_opponent_move

    available_moves = board.each_with_index.select { |cell, i| cell.nil? }.map(&:last)

    return if available_moves.empty?



    index = available_moves.sample

    board[index] = 'O'

  end



  def game_over?

    check_winner || board.none?(&:nil?)

  end

  def who_won?

    WINNING_COMBINATIONS.each do |combo|

      return "X" if combo.all? { |index| board[index] == 'X' }

      return "O" if combo.all? { |index| board[index] == 'O' }

    end

    false

  end

  def check_winner

    WINNING_COMBINATIONS.each do |combo|

      return true if combo.all? { |index| board[index] == 'X' }

      return true if combo.all? { |index| board[index] == 'O' }

    end

    false

  end



  WINNING_COMBINATIONS = [

    [0, 1, 2],

    [3, 4, 5],

    [6, 7, 8],

    [0, 3, 6],

    [1, 4, 7],

    [2, 5, 8],

    [0, 4, 8],

    [2, 4, 6]

  ]

end