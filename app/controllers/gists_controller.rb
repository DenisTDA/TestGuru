class GistsController < ApplicationController
  API_ENDPOINT = 'api.github.com'.freeze

  def index
    @gists = Gist.all
  end

  def create
    @result = Result.find(params[:result])
    @question = @result.current_question
    @user = User.find(params[:user])

    result_gist = GistQuestionService.new(@question).call
    gist = Gist.new(html_url: result_gist.url, question_id: @question.id, user_id: @user.id)

    flash_options = if success?(result_gist) && gist.save
                      { notice: t('.success', url_gist: result_gist[:html_url]) }
                    else
                      { alert: t('.failure') }
                    end
    redirect_to @result, flash_options
  end

  private

  def success?(result_gist)
    result_gist.url.include?(API_ENDPOINT)
  end
end
