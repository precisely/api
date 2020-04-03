class Auth0App

  include Singleton
  include Auth0::Mixins
  include Auth0::Api::AuthenticationEndpoints

  def initialize
    @client_id ||= Rails.application.credentials.dig(:auth0, :frontend_simple, :client_id)
    @client_secret ||= Rails.application.credentials.dig(:auth0, :frontend_simple, :client_secret)
    @base_uri ||= "https://" + Rails.configuration.auth0.dig(:backend_api, :domain)
    @headers ||= {
      "Content-Type" => "application/json"
    }
  end

end
