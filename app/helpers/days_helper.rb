module DaysHelper
  def nutri_delta(input_1, input_2)
    (input_1 === input_2 ? "" : input_1 < input_2 ? "<span class='text-danger'>(- #{input_2 - input_1})</span>" : "<span class='text-success'>(+ #{input_1 - input_2})</span>").html_safe
  end
  def print_date(day)
    day.date == Date.today ? "Today" : day.date.strftime('%B %e, %Y')
  end
  def change_color(input_1, input_2)
    m_10 = input_2 * 0.1
    m_30 = input_2 * 0.3
    c_10 = (input_2 + m_10).floor()
    f_10 = (input_2 - m_10).floor()
    c_30 = (input_2 + m_30).floor()
    f_30 = (input_2 - m_30).floor()
    if input_1 >= f_10 && input_1 <= c_10
      "border-success text-success"
    elsif input_1 >= f_30 && input_1 <= c_30
      "border-warning text-warning"
    else
      "border-danger text-danger"
    end
  end
end
