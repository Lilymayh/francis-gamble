class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :username
      t.string :password_digest # This column is for storing hashed passwords
      t.string :email
      t.datetime :registration_date
      t.decimal :balance, precision: 10, scale: 2, default: 0

      t.timestamps
    end

    add_index :users, :email, unique: true # Add an index for email to enforce uniqueness
  end
end