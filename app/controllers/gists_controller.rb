class GistsController < ApplicationController
  before_action :require_admin, only: %i[index]

  def index
    @gists = Gist.all
  end

  def create
    @result = Result.find(params[:result])
    @question = @result.current_question

    result_gist = GistQuestionService.new(@question).call
    gist = Gist.new(html_url: result_gist[:url], question_id: @question.id, user_id: current_user.id)

    flash_options = if result_gist[:success?]
                      gist.save!
                      { notice: t('.success', url_gist: view_context.link_to(result_gist[:url], result_gist[:url],
                                  rel: 'nofollow noopener', target: '_blank')) }
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
