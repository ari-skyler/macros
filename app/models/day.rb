class Day < ApplicationRecord
  belongs_to :user
  has_many :days_meals
  has_many :meals, through: :days_meals
  has_many :workouts
  has_many :exercises, through: :workouts

  validates :date, presence: true, uniqueness: true

  accepts_nested_attributes_for :days_meals


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

  def calories_burned
    total = 0
    self.workouts.each do |w|
      total += w.exercise.calories_burned * w.amount
    end
    total.floor()
  end

  def workouts_list
    if @workouts_list.nil?
      hash = {}
      self.workouts.each do |i|
        hash[i.exercise_id] = i.amount
      end
      @workouts_list = self.exercises.each do |i|
        i.amount = hash[i.id]
        i.calories_burned = (hash[i.id] * i.calories_burned).floor()
      end
    end
    @workouts_list
  end

  def net_calories
    net = self.nutrition[:calories] - self.calories_burned
    net > 0 ? net.floor() : 0
  end
end
