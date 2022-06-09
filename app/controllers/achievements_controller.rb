class AchievementsController < ApplicationController
  def index
    @achievements = set_achievements
  end

  private

  def set_achievements
    Achievement.user_achieve_badge(current_user)
  end
end
