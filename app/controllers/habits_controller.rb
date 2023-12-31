class HabitsController < ApplicationController
  before_action :authenticate_user!
  before_action :instantiate_data, only: %i[habit_reports previewer]

  def index; end

  def edit
    @habits = current_user.habits
  end

  def previewer; end

  def new
    @habit = Habit.new
  end

  def delete_habit
    @habit = Habit.destroy(params[:id])

    respond_to(&:turbo_stream)
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

  def move
    @habit = Habit.find(params[:id])
    @habit.insert_at(params[:position].to_i)
    head :ok
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

  def habit_reports
    @date = params[:date] ? Time.parse(params[:date]) : Time.now
    @report_percentage = params[:percentage] || HabitLog.get_daily_report(current_user.id, @date)[:report_percentage]
  end

  private

  def instantiate_data
    @habits = Habit.where(user_id: current_user.id)
    @mode = params[:view] || 'daily'
  end

  def new_habits_params
    params.require(:habit).permit(:user_id, :name, :description, :habit_type, :frequency)
  end
end
