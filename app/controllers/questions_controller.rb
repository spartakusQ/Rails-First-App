# Просмотра списка вопросов теста
# Просмотра конкретного вопроса теста
# Создания вопроса. Идентификатор теста к которому принадлежит вопрос 
# можно указать явно в составе URL значения атрибута action в тэге form
# Удаления вопроса
# Используйте метод render внутри действия контроллера чтобы вернуть
#  ответ клиенту как простой текст (plain text) или HTML
# Используйте обратный вызов при поиске теста в контроллере ресурса вопросов
class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show destroy]

  def index
    @questions = @test.questions
  end

  def show
    render plain: @question.body
  end

  def create
    question = @test.questions.new(question_params)
    if question.save
      render plain: "Question '#{question_params[:body]}' create"
    else
      render plain: 'Create error'
    end
  end

  def destroy
    question = @question.destroy
    render plain: "Question '#{question[:body]}' delete"
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

end
