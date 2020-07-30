module DaysHelper
  def nutri_delta(input_1, input_2)
    input_1 === input_2 ? "" : input_1 < input_2 ? "(- #{input_2 - input_1})" : "(+ #{input_1 - input_2})"
  end
  def print_date(day)
    day.date == Date.today ? "Today" : day.date.strftime('%B %e, %Y')
  end
end
