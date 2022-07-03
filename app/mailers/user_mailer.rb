# frozen_string_literal: true

# class UserMailer sends the verification and unsubscribe emails
class UserMailer < ApplicationMailer
  default from: 'verify@pleaseremember.io'

  def verification_email
    @user = params[:user]
    @verify_url = "#{ENV['HOST']}/verify/#{@user.code}"
    @unsubscribe_url = "#{ENV['HOST']}/unsubscribe/#{@user.code}"
    mail(to: @user.email, subject: 'Please Remember verification email')
  end
end
