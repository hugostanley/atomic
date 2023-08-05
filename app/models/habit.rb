class Habit < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: {maximum: 100}
  validates :description, length: {maximum: 500}
  validates :habit_type, inclusion: {in: %w[daily weekly monthly], message: "%<value>s is not a valid type"}
  validates :frequency, numericality: {only_integer: true}
  has_many :habit_logs

  # GET how many is accomplished today
  def logs_for_today
    habit_logs.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
  end

  # GET how many is accomplished this week
  def logs_for_this_week
    date = Time.now
    week_number = (date.day > 28) ? 4 : (date.day / 7.0).ceil
    range = get_week_range(week_number)
    habit_logs.where(created_at: range, habit_id: id)
  end

  # GET how many is accomplished this month
  def logs_for_this_mongth
  end

  private

  def get_week_range(week_number)
    date = Time.now
    case week_number
    when 1
      Time.new(date.year, date.month, 1)..Time.new(date.year, date.month, 7)
    when 2
      Time.new(date.year, date.month, 8)..Time.new(date.year, date.month, 14)
    when 3
      Time.new(date.year, date.month, 15)..Time.new(date.year, date.month, 21)
    when 4
      Time.new(date.year, date.month, 22)..Time.new(date.year, date.month, date.end_of_month.day)
    end
  end
end
