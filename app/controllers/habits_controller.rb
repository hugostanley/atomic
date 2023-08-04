class HabitsController < ApplicationController
  before_action :authenticate_user!
  before_action :instantiate_data
  def index
  end

  def previewer
    @mode = params[:view]
  end

  def new
    @habit = Habit.new
  end

  private

  def instantiate_data
    @date_today = Time.now
    @habits = Habit.where(user_id: current_user.id)
  end
end
