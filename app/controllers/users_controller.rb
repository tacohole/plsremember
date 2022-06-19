# frozen_string_literal: true

# class UsersController handles user subscriptions, verifications, and unsubscriptions
class UsersController < ApplicationController
  def index; end

  def subscribed; end

  def verified; end

  def subscribe
    code = validate(params)
    user = User.create!(email: params[:email], subscribed: true, verified: false, code: code)
    render json: { message: 'User subscribed' } # replace with logging
    UserMailer.with(user: user).verification_email.deliver_now
  end

  def verify
    user = User.where(code: params[:code])
    if user
      user.update(verified: true)
      redirect_to '/verified'
    else
      render json: { message: 'could not find user with that email' } # log
    end
  end

  def unsubscribe
    user = User.where(code: params[:code])
    if user
      user.update(subscribed: false, unsubscribed_date: Time.current)
      redirect_to '/unsubscribed'
    else
      render json: { message: 'could not find user with that email' } # log
    end
  end

  private

  def validate(params)
    raise 'user already exists' if User.where(email: params[:email]).exists?

    user = User.new
    return unless user.validate_captcha(params[:captcha])

    generate_code(16)
  end

  def generate_code(number)
    charset = Array('A'...'Z') + Array('a'...'z') + Array('0'...'9')
    Array.new(number) { charset.sample }.join
  end

  def user_params
    params.require(:email, :code).permit(:subscribed, :unsubscribed_date)
  end
end
