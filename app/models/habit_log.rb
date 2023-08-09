# frozen_string_literal: true

class HabitLog < ApplicationRecord
  belongs_to :user
  belongs_to :habit

  # create a callback to check if the frequency per day is not exceeded yet
  def self.get_daily_report(user_id, date = Time.zone.now)
    logs = HabitLog
           .select('habit_logs.id as habit_log_id, habits.id as habit_id, atomic_users.id as user_id, habit_logs.created_at')
           .joins(:habit, :user)
           .where(habit_logs: { created_at: date.beginning_of_day..date.end_of_day }, habits: { habit_type: 'daily' }, atomic_users: {id: user_id})
    total_logs = logs.length
    habits = Habit.where(user_id:,
                         habit_type: 'daily')
    total_frequency = habits.reduce(0) { |sum, habit| sum + habit.frequency }
    { total_frequency:, total_logs:, report_percentage: (total_logs / total_frequency.to_f * 100).round(2) }
  end

  def self.get_weekly_report(user_id, range)
    logs = HabitLog
           .select('habit_logs.id as habit_log_id, habits.id as habit_id, atomic_users.id as user_id, habit_logs.created_at')
           .joins(:habit, :user)
           .where(habit_logs: { created_at: range }, habits: { habit_type: 'weekly' }, atomic_users: {id: user_id})
    total_logs = logs.length
    habits = Habit.where(user_id:,
                         habit_type: 'weekly')
    total_frequency = habits.reduce(0) { |sum, habit| sum + habit.frequency }
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
