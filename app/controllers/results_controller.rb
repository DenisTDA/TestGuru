class ResultsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_result, only: %i[show result update gist]

  def show; end

  def result; end

  def update
    @result.accept!(params[:answer_ids])

    if @result.complited?
      TestsMailer.complited_test(@result).deliver_now
      redirect_to result_result_path(@result)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@result.current_question).call

    flash_options = if result
      {notice: t('.success', url_gist: result[:html_url]) }
    else
      {alert: t('.failure') }
    end
    
    redirect_to @result, flash_options
  end

  private

  def set_result
    @result = Result.find(params[:id])
  end
end
