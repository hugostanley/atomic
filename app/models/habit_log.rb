class HabitLog < ApplicationRecord
  belongs_to :user
  belongs_to :habit

  # create a callback to check if the frequency per day is not exceeded yet
end
