# Preview all emails at http://localhost:3000/rails/mailers/tests_mailer
class TestsMailerPreview < ActionMailer::Preview
  def complited_test
    result = Result.new(user: User.last, test: Test.first)

    TestsMailer.complited_test(result)
  end
end
