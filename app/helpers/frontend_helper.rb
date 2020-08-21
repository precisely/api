require "utils"


module FrontendHelper

  def frontend_url(*args)
    fe = Utils.ensure_trailing_slash(ENV["URL_FRONTEND"])
    "#{fe}#{args.join('/')}"
  end

end
