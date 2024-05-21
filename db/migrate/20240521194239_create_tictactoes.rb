class CreateTictactoes < ActiveRecord::Migration[6.1]

  def change

    create_table :tictactoes do |t|

      t.text :board, default: '[]' # Store board as JSON string

      t.string :current_turn, default: 'X'



      t.timestamps

    end

  end

end
