class CreateWinnings < ActiveRecord::Migration[6.1]
  def change
    create_table :winnings, id: :uuid do |t|
      t.references :bet, type: :uuid, foreign_key: true, null: false
      t.decimal :winnings_amount, precision: 10, scale: 2
      t.datetime :win_date
      t.timestamps
    end
  end
end

