class AchievementsController < ApplicationController
  before_action :authenticate_user!

  def index
    @achievements = Achievement.by_user(current_user)
  end
end
