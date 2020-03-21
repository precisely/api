class PrivateController < ActionController::API

  include Secured

  def private
    render json: 'Hello from a private endpoint! You need to be authenticated to see this.'
  end

  def lab
    render json 'lab endpoint'
  end

  def admin
    render json: { message: 'Hello from a private endpoint! You need admin:read or admin:write to see this.' }
  end

  def random
    render json: 'random endpoint'
  end

end
