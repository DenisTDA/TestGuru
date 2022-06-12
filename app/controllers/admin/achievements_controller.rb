class Admin::AchievementsController < Admin::BaseController
  def index
    @achievements = Achievement.with_badge
  end

  def show_user_achieved
    params_id = params[:id] || cookies[:id]
    @achievement = Achievement.find(params_id)
    @achievements = Achievement.user_achieve_badge(@achievement.user)
    cookies[:id] = @achievement.id
  end
end
