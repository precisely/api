require 'auth0_app'


class LoginController < ActionController::API

  def login
    auth0_access_token = Auth0App.instance.login_with_resource_owner(
      params[:email],
      params[:password],
      scope: 'root',
      audience: Rails.configuration.auth0.dig(:backend_api, :audience)
    )
    render json: auth0_access_token
  end

  def logout
    # TODO: Implement this.
  end

  def signup
    resp = Auth0App.instance.signup(
      params[:email],
      params[:password]
    )
    # success response format (if 200): {_id, email_verified, email}
    # failure response format (eg 400): {code, description}
    # FIXME: Add user to the database.
    render json: resp
  end

  # XXX: There is no direct "change password" available in Auth0 API! There's
  # only a reset flow which sends an email with a link. The documentation for
  # the library's change_password method is wrong.
  def reset_password
    resp = Auth0App.instance.change_password(
      params[:email],
      "" # must be empty!
    )
    # success response is 200
    # failure response is json (eg 400): {error}
    # FIXME: Return a reasonable status here.
    render {status: "ok"}
  end

end
