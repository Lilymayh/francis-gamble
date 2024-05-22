class CreateFakeUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :fake_users do |t|

      t.timestamps
    end
  end
end
