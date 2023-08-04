class Habit < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: {maximum: 100}
  validates :description, length: {maximum: 500}
  validates :habit_type, inclusion: {in: %w[daily weekly monthly], message: "%<value>s is not a valid type"}
  validates :frequency, numericality: {only_integer: true}
  has_many :habit_logs

  # GET how many is accomplished today 
  def logs_for_today
  end

  # GET how many is accomplished this week 
  def logs_for_this_week
  end

  # GET how many is accomplished this month 
  def logs_for_this_mongth
  end
end
