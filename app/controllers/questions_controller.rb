class QuestionsController < ApplicationController
  before_action :set_test, only: %i[index create new ]
  before_action :set_question, only: %i[show update destroy edit]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def show
    @test = @question.test
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def edit
    @test = @question.test
  end

  def update
    @test = @question.test
    @question = @test.questions.find(params[:id])

    if @question.update(question_params)
      redirect_to test_questions_path(@test)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to action: :index, test_id: @question.test_id
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end
end
