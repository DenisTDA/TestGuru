class ResultsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_result, only: %i[show result update]

  def show
    @timer = set_timer
    redirect_to result_result_path(@result) if !@timer.time_limit.zero? && @timer.time_out?
  end

  def result; end

  def update
    @result.accept!(params[:answer_ids])

    if @result.complited?
      if @result.successful? && CheckAchievementSpecifications.new(@result).create_achievements
        flash[:success] = t('.achieve')
      end
      TestsMailer.complited_test(@result).deliver_now
      redirect_to result_result_path(@result)
    else
      @timer = set_timer
      render :show
    end
  end

  private

  def set_timer
    TimerTest.new(@result.created_at, @result.test_time_limit)
  end

  def set_result
    @result = Result.find(params[:id])
  end
end
