#!/usr/bin/env ruby
#
# Prerequisites:
#   gem install bundler
#   bundle install

dependencies = `bundle show | grep '*' | awk '{print $2, $3}' | sed -e 's/(//' -e 's/)//'`.split("\n")

dependencies.each do |dependency|
  (gem_name, version) = dependency.split
  next if gem_name =~ /rails-assets/

  puts "Installing docs for #{gem_name} #{version} "
  system "open 'dash-install://repo_name=Ruby Docsets&entry_name=#{gem_name}&version=#{version}'"
  sleep 3
end
