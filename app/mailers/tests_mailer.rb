class TestsMailer < ApplicationMailer

  def comleted_test(passing_tests)
    @user = passing_tests.user
    @test = passing_tests.test

    mail to: @user.email, subject: 'You just completed the TestGuru test!'
  end

end
