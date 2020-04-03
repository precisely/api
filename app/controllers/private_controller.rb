class PrivateController < ActionController::API

  include Secured

  # TODO: Deal with this entire controller.

  def private
    render json: 'Hello from a private endpoint! You need to be authenticated to see this.'
  end

  def lab
    render json 'lab endpoint'
  end

  def admin
    render json: { message: 'Hello from a private endpoint! You need root set in Auth0 to see this.' }
  end

  def random
    render json: 'random endpoint'
  end

end
