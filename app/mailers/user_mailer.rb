class UserMailer < ApplicationMailer
  default from: 'pleaserememberdevtest@gmail.com'
  
  def verification_email
    @user = params[:user]
    @verify_url = "#{ENV['HOST']}/verify/#{@user.code}"
    mail(to: @user.email, subject: 'pls remember verification email')
  end
end
