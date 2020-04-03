require 'json_web_token'


module Secured

  extend ActiveSupport::Concern

  included do
    before_action :authenticate_request!
  end

  private

  def authenticate_request!
    auth_token
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end

  def http_token
    if request.headers['Authorization'].present?
      request.headers['Authorization'].split(' ').last
    end
  end

  def auth_token
    JsonWebToken.verify(http_token)
  end

  # TODO: Get these right.
  SCOPES = [
    ['^/admin', ['root']],
    ['^/lab', ['lab:read', 'lab:append']],
    ['^/physician/', ['physician:read', 'physician:append']],
    ['^/user/', ['all:read']],
    ['^/', nil]
  ]

  def authenticate_request!
    @auth_payload, @auth_header = auth_token
    render json: { errors: ['Insufficient scope'] }, status: :unauthorized unless scope_included
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end

  def scope_included
    req = request.env['PATH_INFO']
    auth_scopes = String(@auth_payload['scope']).split(' ')
    SCOPES.each do |definition|
      url, required_scopes = definition
      if req.match(url)
        return (required_scopes.nil? or (auth_scopes & required_scopes).any?)
      end
    end
    return false
  end

end
