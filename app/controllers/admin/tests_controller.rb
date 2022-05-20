class Admin::TestsController < Admin::BaseController
  before_action :set_tests, only: %i[index update_inline]
  before_action :set_test, only: %i[show edit destroy update update_inline]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index; end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.examinations.build(params_test)

    if @test.save
      redirect_to admin_test_path(@test), notice: t('.success', test: @test.title)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(params_test)
      flash[:success] = t('.success', test: @test.title)
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(params_test)
      flash[:success] = t('.title_inline', test: @test.title)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def show; end

  def destroy
    @test.destroy
    flash[:notice] = t('.success', test: @test.title)
    redirect_to action: :index
  end

  private

  def set_tests
    @tests = Test.all
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def params_test
    params.require(:test).permit(:title, :category_id, :level)
  end

  def rescue_with_test_not_found
    render plain: 'Test not found'
  end
end
