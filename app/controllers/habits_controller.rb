class HabitsController < ApplicationController
  before_action :authenticate_user!
  def index
    @habits = Habit.where(user_id: current_user.id)
  end

  def previewer
    @date_today = Time.now
    @mode = params[:view]
  end
end
