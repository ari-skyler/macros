class Day < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :meals_days
  has_many :meals, through: :meals_days
  belongs_to :workout
end
