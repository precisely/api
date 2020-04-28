class V1::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    Rails.logger.level = 0
    super  
  end

end