# frozen_string_literal: true

class HabitLog < ApplicationRecord
  belongs_to :user
  belongs_to :habit

  # create a callback to check if the frequency per day is not exceeded yet
  def self.get_daily_report(user_id, date = Time.zone.now)
    habits = Habit.where(user_id:,
                         habit_type: 'daily').includes(:habit_logs).where(created_at: date.beginning_of_day..date.end_of_day)
    total_frequency = habits.reduce(0) { |sum, habit| sum + habit.frequency }
    total_logs = habits.reduce(0) { |sum, habit| sum + habit.habit_logs.length }
    { total_frequency:, total_logs:, report_percentage: (total_logs / total_frequency.to_f * 100).round(2) }
  end

  # TO BE FINALIZED
  # def self.get_daily_report_of_the_month(user_id)
  #   today = Time.zone.now
  #   result = []
  #   total_days_for_the_month = Time.zone.now.end_of_month.day
  #   total_days_for_the_month.times do |day_number|
  #     current_date = Time.new(today.year, today.month, day_number + 1)
  #     result.push({ **get_daily_report(user_id, current_date), day: current_date  })
  #   end
  #   result
  # end
end
