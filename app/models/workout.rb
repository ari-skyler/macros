class Workout < ApplicationRecord
  belongs_to :user
  belongs_to :day
  belongs_to :exercise

  validates :amount, presence: true

  accepts_nested_attributes_for :exercise
end
