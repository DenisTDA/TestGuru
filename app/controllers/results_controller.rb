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
    result_gist = GistQuestionService.new(@result.current_question).call

    flash_options = if result_gist
                      # byebug
                      save_gist(@result.current_question, current_user, result_gist)
                      { notice: t('.success', url_gist: result_gist[:html_url]) }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @result, flash_options
  end

  private

  def save_gist(question, user, gist)
    Gist.create!(html_url: gist[:html_url], question_id: question.id, user_id: user.id)
  end

  def set_result
    @result = Result.find(params[:id])
  end
end
