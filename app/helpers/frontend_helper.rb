require "utils"


module FrontendHelper

  def frontend_url(*args)
    fe = Utils.ensure_trailing_slash(ENV["FRONTEND_URL"])
    "#{fe}#{args.join('/')}"
  end

end
