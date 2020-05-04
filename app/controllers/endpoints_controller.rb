class EndpointsController < ApplicationController

  def private
    render json: {
      message: "Hello from a private endpoint! You need to be authenticated to see this.",
      user: current_user
    }
    return 
  end

  def public
    render json: {
      message: 'You successfully hit a public endpoint'
    }
  end

  # TODO
  # def admin
  #   render json: { 
  #     message: "Hello from a private endpoint! You need admin privelege to see this." 
  #   }
  # end

end
