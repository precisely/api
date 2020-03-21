module Utils


  def Utils.ensure_trailing_slash(url)
    url.match(/.*\/$/) ? url : "#{url}/"
  end


end
