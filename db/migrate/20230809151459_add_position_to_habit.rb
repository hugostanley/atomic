class AddPositionToHabit < ActiveRecord::Migration[7.0]
  def change
    add_column :habits, :position, :integer
    User.all.each do |user|
      user.habits.order(:updated_at).each.with_index(1) do |habit_item, index|
        habit_item.update_column :position, index
      end
    end
  end
end
