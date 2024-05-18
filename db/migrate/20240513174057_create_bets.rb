class CreateBets < ActiveRecord::Migration[6.1]
  def change
    create_table :bets, id: :uuid do |t|
      t.references :user, type: :uuid, foreign_key: true, null: false
      t.references :game, type: :uuid, foreign_key: true, null: false
      t.decimal :bet_amount, precision: 10, scale: 2, null: false
      t.datetime :bet_date, null: false
      t.timestamps
    end
  end
end
