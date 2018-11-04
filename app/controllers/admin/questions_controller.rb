class Admin::QuestionsController < Admin::BaseController

  before_action :find_test, only: %i[create new]
  before_action :find_question, only: %i[show destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def new
    @question = @test.questions.new
  end

  def show

  end

  def edit

  end


  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to admin_test_path(@test), notice: t('admin.created', resource: @question.model_name.human)
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_test_path(@question.test), notice: t('admin.deleted', resource: @question.model_name.human)
  end

  def update
    if @question.update(question_params)
      redirect_to admin_test_path(@question.test), notice: t('admin.updated', resource: @question.model_name.human)
    else
      render :edit
    end
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found.'
  end

end
