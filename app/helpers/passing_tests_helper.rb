module PassingTestsHelper
  def show_result_message(passing_test)
    passing_test.successfully_completed? ? t('passing_tests.result.success') : t('passing_tests.result.failed')
  end
  def set_result_color(passing_test)
    passing_test.successfully_completed? ? 'success' : 'fail'
  end
end
