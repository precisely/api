require "utils"


module FrontendHelper

  def frontend_url(*args)
    fe = Utils.ensure_trailing_slash(Rails.configuration.frontend.url)
    "#{fe}#{args.join('/')}"
  end

end
