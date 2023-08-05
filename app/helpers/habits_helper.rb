module HabitsHelper
  def get_week_number(date = Time.now)
    # The day today should be divided with 7
    #
    # "How many 7 days are there in the day today?" 
    return 4 if date.day > 28
    (date.day / 7.0).ceil
  end
end
