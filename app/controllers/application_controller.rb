class ApplicationController < ActionController::API

  before_action :authenticate_user_from_token!

  class AccessDenied < StandardError; end

  rescue_from AccessDenied do |e|
    render json: {error: 'unauthorized'}, status: 401
  end

  ##
  # User Authentication
  # Authenticates the user with OAuth2 Resource Owner Password Credentials Grant
  def authenticate_user_from_token!
    auth_token = request.headers['Authorization']

    user = User.find_by(access_token: auth_token)

    fail AccessDenied unless user

    @current_user = user
  end

  def current_user
    @current_user
  end

end
