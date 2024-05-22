class AddBalanceToFakeUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :fake_users, :balance, :integer
  end
end
