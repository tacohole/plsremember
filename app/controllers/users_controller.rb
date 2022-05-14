class UsersController < ApplicationController
  def index
  end

  def subscribed
  end

  def verified
  end

  def subscribe
    if User.where(email: params[:email]).exists?(conditions = :none)
      raise 'user already exists'
    else
      captcha_message = "The data you entered for the CAPTCHA wasn't correct.  Please try again"
      if !verify_recaptcha(model: @user, message: captcha_message)
        code = generate_code(16)
        user = User.create!(email: params[:email], subscribed: true, verified: false, code: code)
        render json: { message: 'User subscribed' }
        UserMailer.with(user: user).verification_email.deliver_now
      end
    end
  end

  def verify
    user = User.where(code: params[:code])
    if user
      verified = user.update(verified: true)
    else
      render json: { message: 'could not find user with that email'}
    end
    if verified
      redirect_to '/verified'
    end
  end

  def unsubscribe 
    user = User.find(params[:code])
    if user
      removed = user.update!(unsubscribed: true, unsubscribe_date: Time.current)
    else 
      render json: { message: 'could not find user with that email'}
    end
    if removed
      render json: {message: 'User unsubscribed'}
    end
  end

  def list_subscribers
    subscribers = User.where(verified: true, unsubscribe_date: nil)
    return subscribers
  end

  private
  def generate_code(number)
    charset = Array('A'...'Z') + Array('a'...'z')
    Array.new(number) { charset.sample }.join
  end

  def user_params
    params.require(:email).permit(:subscribed, :unsubscribe_date, :code)
  end
end
