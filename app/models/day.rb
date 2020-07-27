class Day < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :days_meals
  has_many :meals, through: :days_meals
  belongs_to :workout, optional: true
  validates :date, presence: true, uniqueness: true
  accepts_nested_attributes_for :days_meals
end
