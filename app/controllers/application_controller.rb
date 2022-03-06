class ApplicationController < ActionController::API
  rescue_from Exception, with: :not_valid_request

  private
  def not_valid_request(error)
    render json: {error: error.message} , status: 400
  end  

end
