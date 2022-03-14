class TestsController < ApplicationController
  before_action :set_test, only: %i[show edit destroy update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(params_test)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(params_test)
      redirect_to @test
    else
      render :edit
    end
  end

  def show; end

  def destroy
    @test.destroy
    redirect_to action: :index
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def params_test
    params.require(:test).permit(:title, :category_id, :level, :author_id)
  end

  def rescue_with_test_not_found
    render plain: 'Test not found'
  end
end
