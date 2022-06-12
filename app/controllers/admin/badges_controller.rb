class Admin::BadgesController < Admin::BaseController
  include Rules

  before_action :set_badge, only: %i[destroy update edit]
  before_action :set_rules, only: %i[index edit]

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
    @free_pictures = list_pictures
    @free_rules = list_rules
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badges_path
      flash[:notice] = "The new badge '#{@badge.name}' was created"
    else
      render :new
      flash[:alert] = 'Have a mistake'
    end
  end

  def edit
    @free_pictures = list_pictures
    @free_rules = list_rules
    @free_pictures.insert(0, @badge.picture)
    @free_rules[@badge.rule] = @rules[@badge.rule]
  end

  def update
    if @badge.update(badge_params)
      flash[:notice] = 'Badge was updated'
      redirect_to admin_badge_path(@badge)
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
    params.require(:badge).permit(:rule, :name, :picture)
  end

  def set_rules
    @rules = set_all_rules
  end
end
