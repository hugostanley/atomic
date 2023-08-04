class AddFrequencyToHabit < ActiveRecord::Migration[7.0]
  def change
    add_column :habits, :frequency, :integer
  end
end
