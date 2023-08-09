module HabitsHelper
  def get_week_number(date = Time.now)
    # The day today should be divided with 7
    #
    # "How many 7 days are there in the day today?"
    return 4 if date.day > 28

    (date.day / 7.0).ceil
  end

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

  def daily_reports_this_month
    date = Time.zone.now
    last_day_of_the_month = date.end_of_month.day
    results = []
    (1..last_day_of_the_month).each do |n|
      new_date = Time.new(date.year, date.month, n)
      results.push({**HabitLog.get_daily_report(current_user.id, new_date), date: new_date})
    end
    results
  end
end
