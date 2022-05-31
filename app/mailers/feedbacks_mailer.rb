class FeedbacksMailer < ApplicationMailer
  def message_email(text_body, user)
    @text = text_body
    @user = user
    @admins = User.where(type: 'Admin')
    emails = @admins.collect(&:email).join(',')

    mail from: @user.email, to: emails, subject: 'Feedback massege'
  end
end
