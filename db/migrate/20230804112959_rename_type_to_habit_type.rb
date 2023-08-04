class RenameTypeToHabitType < ActiveRecord::Migration[7.0]
  def change
    rename_column :habits, :type, :habit_type
  end
end
