class GistsController < ApplicationController
  def create
    @result = Result.find(params[:result])
    @question = @result.current_question

    gist_result = GistQuestionService.new(@question).call

    if gist_result.success?
      Gist.create!(html_url: gist_result.url, question_id: @question.id, user_id: current_user.id)      
      flash_options = { notice: t('.success', url_gist: view_context.link_to(gist_result.url, gist_result.url,
                                                                             rel: 'nofollow noopener', target: '_blank')) }
    else
      flash_options = { alert: t('.failure') }
    end
    redirect_to @result, flash_options
  end
end
