class UsersController < ApplicationController
  def index
  end

  def subscribe
    if User.where(email: params[:email]).exists?(conditions = :none)
      raise 'user already exists'
    else
      User.create!(email: params[:email], subscribed: true, verified: false)
      render json: { message: 'User subscribed' }
    end
  end

  def verify
    user = User.find(params[:email])
    if user
      verified = user.update!(verified: true)
    else
      render json: { message: 'could not find user with that email'}
    end
    if verified
      render json: { message: 'user subscription verified'}
    end
  end

  def unsubscribe 
    user = User.find(params[:email])
    if user
      removed = user.update!(unsubscribed: true, unsubscribe_date: Time.current)
    else 
      render json: { message: 'could not find user with that email'}
    end
    if removed
      render json: {message: 'User unsubscribed'}
    end
  end

  def user_params
    params.require(:email).permit(:subscribed, :unsubscribe_date)
  end
end
