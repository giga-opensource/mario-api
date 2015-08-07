class SessionsController < ApplicationController

  skip_before_action :authenticate_user_from_token!

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: user, serializer: SessionSerializer
    else
      render status: 400, json: { errors: ['invalid email or password.']}
    end
  end

end