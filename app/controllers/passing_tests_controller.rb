class PassingTestsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_passing_test, only: %i[show result update]

  def show

  end

  def result

  end

  def update
    @passing_test.accept!(params[:answer_ids])
    if @passing_test.completed?
      redirect_to result_passing_test_path(@passing_test)
    else
      render :show
    end
  end

  private

  def find_passing_test
    @passing_test = PassingTest.find(params[:id])
  end

end
