class HabitLog < ApplicationRecord
  belongs_to :user
  belongs_to :habit

  # create a callback to check if the frequency per day is not exceeded yet
  def self.get_daily_report(user_id)
    habits = Habit.where(user_id:,
                         habit_type: 'daily').includes(:habit_logs).where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    total_frequency = habits.reduce(0) { |sum, habit| sum + habit.frequency }
    total_logs = habits.reduce(0) { |sum, habit| sum + habit.habit_logs.length }
    { total_frequency:, total_logs:, report_percentage: (total_logs / total_frequency.to_f * 100).round(2) }
  end
end
