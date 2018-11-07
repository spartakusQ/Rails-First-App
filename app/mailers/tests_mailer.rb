class TestsMailer < ApplicationMailer

  def completed_test(passing_test)
    @user = passing_test.user
    @test = passing_test.test

    mail to: @user.email, subject: 'You just completed the TestGuru test!'
  end

end
