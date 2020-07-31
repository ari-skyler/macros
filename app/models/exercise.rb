class Exercise < ApplicationRecord
  has_many :workouts
  has_many :days, through: :workouts, dependent: :destroy
  validates :name, presence: true
  validates :calories_burned, presence: true

  accepts_nested_attributes_for :workouts

  attr_accessor :amount

  def amount
    label = self.time_based ? "Min" : "X"
    "#{@amount} #{label}"
  end
end
