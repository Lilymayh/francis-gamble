class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games, id: :uuid do |t|
      t.string :name
      t.string :game_type
      t.timestamps
    end
  end
end
