class ChangeTableName < ActiveRecord::Migration[7.0]
  def change
    rename_table :users, :atomic_users
  end
end
