class UserMailer < ApplicationMailer
  default from: ENV["GMAIL_USER"]

  def verification_email
    @user = params[:user]
    @verify_url = ENV["HOST"] + '/verify'
    mail(to: @user.email, subject: 'pls remember verification email')
  end
end
