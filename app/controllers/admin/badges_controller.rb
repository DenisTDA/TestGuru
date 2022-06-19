class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: %i[destroy update edit]
  before_action :set_imgs, only: %i[new create edit update]
  before_action :set_rules, only: %i[new create edit update]

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to admin_badges_path
      flash[:notice] = "The new badge < #{@badge.name} > was created"
    else
      render :new
    end
  end

  def edit
    @imgs.insert(0, @badge.picture)
    @rules << @badge.rule
  end

  def update
    if @badge.update(badge_params)
      flash[:notice] = 'Badge was updated'
      redirect_to admin_badges_path
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    flash[:notice] = 'Badge was deleted'
    redirect_to admin_badges_path
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:rule_id, :name, :picture)
  end

  def set_imgs
    @imgs = Badge.get_imgs_free
  end

  def set_rules
    @rules = Rule.get_rules_free.to_a
  end
end
