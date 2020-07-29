class Exercise < ApplicationRecord
  has_many :workouts
  
  accepts_nested_attributes_for :workouts

  attr_accessor :amount

  def amount
    label = self.time_based ? "Min" : "X"
    "#{@amount} #{label}"
  end
end
