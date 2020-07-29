class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy]

  def index
    @workouts = Workout.all
  end

  def show
  end

  def new
    @workout = Workout.new
  end

  def edit
  end

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

  def update
  end

  def destroy

  end

  private

    def set_workout
      @workout = Workout.find(params[:id])
    end

    def workout_params
      params.require(:workout).permit(:user_id, :exercise_id, :amount)
    end
end
