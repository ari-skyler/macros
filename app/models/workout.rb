class Workout < ApplicationRecord
  belongs_to :user
  belongs_to :day
  belongs_to :exercise
end
