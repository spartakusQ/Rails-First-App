class Admin::TestsController < Admin::BaseController

  before_action :find_test, only: %i[show edit update destroy start]

  def index
    @tests = Test.all
  end

  def show
  end

  def edit
  end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.tests_author.new(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end
end
