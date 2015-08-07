class UsersController < ApplicationController
  skip_before_action :authenticate_user_from_token!

  def new
    user = User.new(user_params)
    if user.save
      render json: user, serializer: SessionSerializer
    else
      render status: 400, json: { errors: user.errors.to_a}
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end