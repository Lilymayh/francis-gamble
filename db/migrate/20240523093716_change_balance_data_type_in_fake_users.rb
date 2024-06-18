class ChangeBalanceDataTypeInFakeUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :fake_users, :balance, :decimal, precision: 10, scale: 2
  end
end

