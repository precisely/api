class PiaController < ApplicationController

  include ReverseProxy::Controller

  def proxy
    reverse_proxy ENV["PIA_URL"], path: request.fullpath.sub(/^\/endpoints\/pia/, "") do |config|
      # fill in as needed?
    end
  end

end
