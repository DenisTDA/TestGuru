class Admin::AchievementsController < Admin::BaseController
  before_action :set_imgs, only: %i[index show_user_achieved]
  before_action :set_rules, only: %i[index show_user_achieved]

  def index
    @achievements = Achievement.all
  end

  def show_user_achieved
    params_id = params[:id] || cookies[:id]
    @achievement = Achievement.find(params_id)
    @achievements = Achievement.by_user(@achievement.user_id)
    cookies[:id] = @achievement.id
  end

  private

  def set_imgs
    @imgs = Badge.get_imgs
  end

  def set_rules
    @rules = Rule.all
  end
end
