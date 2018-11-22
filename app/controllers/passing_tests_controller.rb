class PassingTestsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_passing_test, only: %i[show result update gist]

  def show

  end

  def result

  end

  def update
    answer_ids = []
    @passing_test.accept!(params[:answer_ids]) if answer_ids.any?
    if @passing_test.completed?
      TestsMailer.completed_test(@passing_test).deliver_now
      redirect_to result_passing_test_path(@passing_test)
    else
      render :show
    end
  end

  def gist
    service = GistQuestionService.new(@passing_test.current_question)
    response = service.call

    gist_url = response.html_url
    gist_link = view_context.link_to(gist_url, gist_url, target: :blank)

    flash_option = if service.status_ok?
      make_gist!(gist_url)
        { notice: t('.success', url: gist_link) }
      else
        { alert: t('.failed') }
      end
      redirect_to @passing_test, flash_option
  end

  private

  def find_passing_test
    @passing_test = PassingTest.find(params[:id])
  end

  def make_gist!(gist_url)
    current_user.gists.create(question: @passing_test.current_question, url: gist_url)
  end
end
