class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def authenticate
    authenticate_or_request_with_http_basic("Krmelin") do |username, password|
      username == ENV["LOGIN_USERNAME"] && password == ENV["LOGIN_PASSWORD"]
    end
  end
end
