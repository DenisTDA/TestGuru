class QuestionsController < ApplicationController
  before_action :set_test, only: %i[index create new]
  before_action :set_question, only: %i[show destroy]
  
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    list_questions = @test.questions.inspect
    render plain: list_questions.split('#').join("\n")
  end

  def show
    render inline: "<p> <%= @question.inspect %> </p>
    <%= button_to 'delete', @question, :method => 'delete' %>"
  end

  def new
    @question = Question.new()
  end

  def create
    @question = @test.questions.build(question_param)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def destroy
    @question.delete
    render inline: '<p> The question <%= @question.inspect %> was deleted</p>'
  end

  protected

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_param
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end
end
