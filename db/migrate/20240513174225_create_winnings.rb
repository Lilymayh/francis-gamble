class CreateWinnings < ActiveRecord::Migration[6.1]
  def change
    create_table :winnings, id: :uuid do |t|
      t.uuid :bet_id
      t.decimal :winnings_amount, precision: 10, scale: 2
      t.datetime :win_date
      t.timestamps
    end
  end
end
