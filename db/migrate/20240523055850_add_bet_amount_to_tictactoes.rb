class AddBetAmountToTictactoes < ActiveRecord::Migration[6.1]
  def change
    add_column :tictactoes, :bet_amount, :integer
  end
end