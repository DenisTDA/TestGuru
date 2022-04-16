class GistsController < ApplicationController
  before_action :require_admin, only: %i[index]

  def index
    @gists = Gist.all
  end

  def create
    @result = Result.find(params[:result])
    @question = @result.current_question
    @user = User.find(params[:user])

    result_gist = GistQuestionService.new(@question).call

    gist = Gist.new(html_url: result_gist[:gist].url, question_id: @question.id, user_id: @user.id)

    flash_options = if result_gist[:success?] && gist.save!
                      { notice: t('.success', url_gist: result_gist[:gist][:html_url]) }
                    else
                      { alert: t('.failure') }
                    end
    redirect_to @result, flash_options
  end

  private

  def require_admin
    return if current_user.admin?

    flash[:warning] = 'You must be logged as admin to access this section'
    redirect_to root_path
  end
end
