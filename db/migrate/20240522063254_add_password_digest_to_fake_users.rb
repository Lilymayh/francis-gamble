class AddPasswordDigestToFakeUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :fake_users, :password_digest, :string
  end
end
