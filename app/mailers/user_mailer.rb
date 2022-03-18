class UserMailer < ApplicationMailer
    default from: 'troy.coll@gmail.com'

  def verification_email
    @user = params[:user]
    @verify_url = 'https://plsremember.com/verify'
    mail(to: @user.email, subject: 'pls remember verification email')
  end
end
