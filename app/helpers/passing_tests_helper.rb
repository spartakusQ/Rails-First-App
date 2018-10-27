module PassingTestsHelper
  def show_result_message(passing_test)
    passing_test.successfully_completed? ? 'completed successfully' : 'failed'
  end
  def set_result_color(passing_test)
    passing_test.successfully_completed? ? 'success' : 'fail'
  end
end
