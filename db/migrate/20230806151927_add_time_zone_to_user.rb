class AddTimeZoneToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :atomic_users, :time_zone, :string
  end
end
