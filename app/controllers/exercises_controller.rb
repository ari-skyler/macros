class ExercisesController < ApplicationController

  def new
    @exercise = Exercise.new
    @exercise.workouts.build(day: Day.find_by(date: params[:date], user: current_user), user: current_user)
  end

  def create
    @exercise = Exercise.new(exercise_params)
    day = Day.find(exercise_params[:workouts_attributes]["0"][:day_id])
    if @exercise.valid?
      @exercise.save
      redirect_to '/days/' + day.date
    else
      render :new
    end
  end

  private

    def exercise_params
      params.require(:exercise).permit(:time_based, :name, :calories_burned, workouts_attributes: [:amount, :user_id, :day_id])
    end
end
