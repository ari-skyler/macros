class User < ApplicationRecord
  has_many :meals
  has_many :workouts
  has_many :dates
end
