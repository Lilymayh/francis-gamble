class AddEmailToFakeUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :fake_users, :email, :string
  end
end
