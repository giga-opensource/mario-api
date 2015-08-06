class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      result = user.attributes.slice('id', 'email', 'username')
      result['access_token'] = SecureRandom.hex(32)
      render json: result
    else
      render status: 400, json: { message: 'invalid email or password.'}
    end
  end

  def destory

  end
end