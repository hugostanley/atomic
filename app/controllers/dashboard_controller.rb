class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def current_user_profile
  end
end
