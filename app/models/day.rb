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

  def self.thirty_day_overview(current_user)
    days_calories = [{name: "Goal", data: {}}, {name: "Actual", data: {}}]
    days_weight = [{name: "Weight", data: {}}]
    nutrition_breakdown = {:fat => 0, :carbs => 0, :protein => 0, :fiber => 0, :sugar => 0}
    days = Day.where(user: current_user).order('date DESC').limit(30).each do |day|
      days_calories[1][:data][day.date] = day.net_calories || 0
      days_calories[0][:data][day.date] = current_user.nutrition[:calories] || 0
      days_weight[0][:data][day.date] = day.weight || current_user.weight
      nutrition_breakdown = nutrition_breakdown.merge(day.nutrition){|k, v, vv| v + vv if k != :calories}
    end
    nutrition_breakdown[:carbs] = nutrition_breakdown[:carbs] - nutrition_breakdown[:fiber] - nutrition_breakdown[:sugar]
    {:days_calories => days_calories, :days_weight => days_weight, :nutrition_breakdown => nutrition_breakdown}
  end
end
