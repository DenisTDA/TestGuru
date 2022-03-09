class QuestionsController < ApplicationController
  before_action :define_test, only: %i[index create]
  skip_before_action :verify_authenticity_token

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    list_questions = define_test.questions.inspect
    render plain: list_questions.split('>,').join("\n")
  end

  def show
    question = Question.find(params[:id]).inspect
    render plain: question
  end

  def new; end

  def create
    question = define_test.questions.create!(question_param)
    render plain: question.inspect
  end

  def destroy
    @question = Question.find(params[:id]).inspect
    Question.delete(params[:id])
    render inline: '<p> The question <%= @question %> was deleted</p>'
  end

  protected

  def define_test
    Test.find(params[:test_id])
  end

  def question_param
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end
end
