require 'auth0_app'


class LoginController < ActionController::API

  def login
    auth0_access_token = Auth0App.instance.login_with_resource_owner(
      params[:login],
      params[:password],
      scope: 'root',
      audience: Rails.configuration.auth0.dig(:backend_api, :audience)
    )
    render json: auth0_access_token
  end

  def logout
    # TODO: Implement this.
  end

end
