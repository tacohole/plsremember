class UserMailer < ApplicationMailer
  default from: 'pleaserememberdevtest@gmail.com'
  def verification_email
    @user = params[:user]
    @verify_url = 'https://plsremember.com/verify/' + @user.code
    mail(to: @user.email, subject: 'pls remember verification email')
  end
end
