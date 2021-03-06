class ResultsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_result, only: %i[show result update]

  def show; end

  def result; end

  def update
    @result.accept!(params[:answer_ids])

    if @result.complited?
      if @result.successful? && CheckAchievementSpecifications.new(@result).create_achievements
        flash[:success] = t('.achieve')
      end
      redirect_to result_result_path(@result)
    else
      render :show
    end
  end

  private

  def set_result
    @result = Result.find(params[:id])
  end
end
