# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(username: "aaron", email: "asky28@gmail.com", password: "password", weight: 155, gender: "M", calories_target: 1750, protein_target: 160, fat_target: 50, carbs_target: 260, fiber_target: 30, sugar_target: 30)

i = 1
28.times do
  Day.create(date: Date.new(2020, 7, i), user: user)
  i +=1
end

exercises = Exercise.create([
  {time_based: true, name: "Bike Ride (Intense 15-16 mph)", calories_burned: 12},
  {time_based: false, name: "Pushups", calories_burned: 0.3},
  {time_based: true, name: "Running (5-7 mph)", calories_burned: 13.2},
  {time_based: true, name: "Walking", calories_burned: 7.5}
  ])

i = 1
28.times do
  user.workouts.create(day_id: i, exercise_id: rand(4), amount: rand(15..60))
  i +=1
end


ingredients = Ingredient.create([
  {name: "Dave's Killer Bread Slice", calories: 120, protein: 5, fiber: 5, fat: 1.5, carbs: 22, sugar: 5},
  {name: "Half Avocado", calories: 120, protein: 1.5, fiber: 4.5, fat: 8, carbs: 6, sugar: 0},
  {name: "Egg", calories: 70, protein: 6, fiber: 0, fat: 5, carbs: 0, sugar: 0}
  ])

meal = user.meals.create(name: "Avocado Toast")

i = 1
28.times do
  DaysMeal.create(day_id: i, meal_id: 1)
  i +=1
end

IngredientsMeal.create([
  {meal: meal, ingredient_id: 3, servings: 2},
  {meal: meal, ingredient_id: 2, servings: 1},
  {meal: meal, ingredient_id: 1, servings: 2}
  ])

DaysMeal.create(day_id: 1, meal: meal)
