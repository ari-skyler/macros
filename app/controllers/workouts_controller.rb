class WorkoutsController < ApplicationController

  def create
    workout = Workout.new(workout_params)
    workout.user = current_user
    workout.day = Day.find_by(date: Date.today, user: current_user)
    if workout.valid?
      workout.save
      redirect_to '/today'
    else
      redirect_to '/today'
    end
  end

  private

    def workout_params
      params.require(:workout).permit(:user_id, :exercise_id, :amount)
    end
end
