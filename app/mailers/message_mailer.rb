class MessageMailer < ActionMailer::Base
  default from: Rails.configuration.email.username

  def user_messages(user)
    @user = user
    mail( to: @user.email, subject: Rails.configuration.email.subject )
  end
end
