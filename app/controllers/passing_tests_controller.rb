class PassingTestsController < ApplicationController

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

  def set_test_passing
    @passing_test = PassingTest.find(params[:id])
  end

end
