class Admin::AchievementsController < Admin::BaseController
  def index
    @achievements = set_achievements
  end

  def show_user_achieved
    @achievement = set_achievement
    @achievements = Achievement.user_achieve_badge(@achievement.user)
  end

  private

  def set_achievements
    Achievement.with_badge
  end

  def user_params
    params.require(:achievement).permit(:id)
  end

  def set_achievement
    Achievement.find(params[:id])
  end
end
