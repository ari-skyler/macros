module DaysHelper
  def nutri_delta(input_1, input_2)
    input_1 === input_2 ? input_1 : input_1 < input_2 ? "- #{input_2 - input_1}" : "+ #{input_1 - input_2}"
  end
end
