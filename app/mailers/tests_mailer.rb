class TestsMailer < ApplicationMailer
  def complited_test(result)
    @user = result.user
    @test = result.test

    mail to: @user.email, subject: "You just complited the TestGuru's test!"
  end
end
