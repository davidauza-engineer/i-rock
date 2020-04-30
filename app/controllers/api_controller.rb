class ApiController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_action :validate_header

  private

  def validate_header
    p request.headers['Content-Type']
    if request.headers['Content-Type'] != 'application/vnd.api+json'
      render json: {}, status: 400
      return
    end
  end
end
