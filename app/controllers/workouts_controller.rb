class WorkoutsController < ApplicationController

  def create
    workout = Workout.new(workout_params)
    workout.user = current_user
    workout.day = Day.find_by(date: params[:date], user: current_user)
    workout.valid? ? workout.save : workout.errors.full_messages.each {|m| flash.alert = "Workout: " + m}
    redirect_to '/days/' + params[:date]
  end
  def destroy
    day = Day.find_by(date: params[:date], user: current_user)
    workout = Workout.find_by(exercise_id: params[:workout_id], day: day)
    workout.destroy
    redirect_to '/days/' + params[:date]
  end
  private

    def workout_params
      params.require(:workout).permit(:user_id, :exercise_id, :amount)
    end
end
