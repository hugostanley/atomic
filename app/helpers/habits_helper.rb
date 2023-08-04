module HabitsHelper
  def get_week_number(date = Time.now)
    first_day_of_month = Time.new(date.year, date.month, 1)
    (date.day - first_day_of_month.day) / 7 + 1
  end
end
