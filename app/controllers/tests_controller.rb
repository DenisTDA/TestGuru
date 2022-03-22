class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test, only: %i[show edit destroy update start]

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
      flash[:notice] = "Test '#{@test.title}' was saved successfully"
      redirect_to @test
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(params_test)
      flash[:notice] = "Test '#{@test.title}' was updated"
      redirect_to @test
    else
      render :edit
    end
  end

  def show; end

  def destroy
    @test.destroy
    flash[:notice] = "Test '#{@test.title}' was deleted"
    redirect_to action: :index
  end

  def start
    set_user
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
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

  def set_user
    @user = User.first
  end
end
