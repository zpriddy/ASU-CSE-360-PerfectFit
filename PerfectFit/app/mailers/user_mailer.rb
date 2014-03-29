class UserMailer < ActionMailer::Base
  default from: "asu.perfectfit@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  #def password_reset
  #  @greeting = "Hi"

  #  mail to: "to@example.org"
  #end
  def welcome_message(user, profile)
    @user = user
    @user_first_name = profile.first_name
    mail :to => user.email, :subject => "Welcome To PerfectFit"
  end

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end

end
