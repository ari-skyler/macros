class ExercisesController < ApplicationController

  def new
    @exercise = Exercise.new
    @exercise.workouts.build(day: Day.find_by(date: Date.today, user: current_user), user: current_user)
  end

  def create
    exercise = Exercise.create(exercise_params)
    redirect_to '/today'
  end

  private

    def exercise_params
      params.require(:exercise).permit(:time_based, :name, :calories_burned, workouts_attributes: [:amount, :user_id, :day_id])
    end
end
