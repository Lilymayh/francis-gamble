class CreateBets < ActiveRecord::Migration[6.1]
  def change
    create_table :bets, id: :uuid do |t|
      t.uuid :user_id
      t.uuid :game_id
      t.decimal :bet_amount, precision: 10, scale: 2
      t.datetime :bet_date
      t.timestamps
    end
  end
end
