class Day < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :days_meals
  has_many :meals, through: :days_meals
  belongs_to :workout, optional: true
  validates :date, presence: true, uniqueness: true
  accepts_nested_attributes_for :days_meals
  attr_accessor :nutrition
  def nutrition
    if @nutrition.nil?
      hash = {:calories => 0, :fat => 0, :carbs => 0, :protein => 0, :fiber => 0, :sugar => 0}
      self.meals.each do |m|
        hash = hash.merge(m.nutrition){|k, v, vv| v + vv}
      end
      @nutrition = hash
    end
    @nutrition
  end
end
