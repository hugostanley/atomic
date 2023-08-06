class HabitsController < ApplicationController
  before_action :authenticate_user!
  before_action :instantiate_data

  def index; end

  def previewer
    @mode = params[:view]
  end

  def new
    @habit = Habit.new
  end

  def create
    @habit = Habit.new(new_habits_params)

    respond_to do |format|
      # looks for a turbo_stream template
      #
      # located at: views/habits/create.turbo_stream.erb
      format.turbo_stream if @habit.save
    end
  end

  def log_habit
    @habit = Habit.find_by(id: params[:id])
    @habit_log = HabitLog.new(user_id: @habit.user_id, habit_id: @habit.id)
    @amount = @habit.current_logs.length

    respond_to do |format|
      if @amount < @habit.frequency
        if @habit_log.save
          @amount += 1
          format.turbo_stream
        end

      else
        format.html { redirect_to previewer_path('daily') }
      end
    end
  end

  private

  def instantiate_data
    @date_today = Time.now
    @habits = Habit.where(user_id: current_user.id)
  end

  def new_habits_params
    params.require(:habit).permit(:user_id, :name, :description, :habit_type, :frequency)
  end
end
