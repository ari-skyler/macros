class DaysMeal < ApplicationRecord
  belongs_to :meal
  belongs_to :day
  accepts_nested_attributes_for :meal
end
