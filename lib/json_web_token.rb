require 'net/http'
require 'uri'

require 'utils'


class JsonWebToken

  def self.verify(token)
    JWT.decode(token,
               nil,
               true, # verify the signature of this token
               algorithm: 'RS256',
               # XXX: There MUST be a trailing slash at the end of the iss
               # parameter, or validation fails!
               iss: Utils.ensure_trailing_slash("https://#{Rails.configuration.auth0.domain}/"),
               verify_iss: true,
               aud: Rails.configuration.auth0.audience,
               verify_aud: true) do |header|
      jwks_hash[header['kid']]
    end
  end

  def self.jwks_hash
    jwks_raw = Net::HTTP.get URI("https://#{Rails.configuration.auth0.domain}/.well-known/jwks.json")
    jwks_keys = Array(JSON.parse(jwks_raw)['keys'])
    Hash[
      jwks_keys.map do |k|
        [
          k['kid'],
          OpenSSL::X509::Certificate.new(
            Base64.decode64(k['x5c'].first)
          ).public_key
        ]
      end
    ]
  end

end
