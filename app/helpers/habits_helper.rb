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
end
