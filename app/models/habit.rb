class Habit < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: {maximum: 100}
  validates :description, length: {maximum: 500}
  validates :habit_type, inclusion: {in: %w[daily weekly monthly], message: "%<value>s is not a valid type"}
  validates :frequency, numericality: {only_integer: true}
end
