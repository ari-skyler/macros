class ExercisesController < ApplicationController
  def index
    @exercises = Exercise.all
  end
  def new
    @exercise = Exercise.new
    @exercise.workouts.build(day: Day.find_by(date: params[:date], user: current_user), user: current_user) if params[:date]
  end

  def create
    @exercise = Exercise.new(exercise_params)
    day = Day.find(exercise_params[:workouts_attributes]["0"][:day_id]) if exercise_params[:workouts_attributes]
    if @exercise.valid?
      @exercise.save
      redirect_to '/days/' + day.date if exercise_params[:workouts_attributes]
      redirect_to exercises_path
    else
      render :new
    end
  end
  def edit
    @exercise = Exercise.find(params[:id])
  end
  def update
    @exercise = Exercise.find(params[:id])
    @exercise.assign_attributes(exercise_params)
    if @exercise.valid?
      @exercise.save
      redirect_to exercises_path
    else
      render :edit
    end
  end
  def destroy
    Exercise.destroy(params[:id])
    redirect_to exercises_path
  end
  private

    def exercise_params
      params.require(:exercise).permit(:time_based, :name, :calories_burned, workouts_attributes: [:amount, :user_id, :day_id])
    end
end
