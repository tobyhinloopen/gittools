#!/usr/bin/env ruby

require 'json'

def try_foreman
  return "bundle exec foreman start -f Procfile.dev" if File.exists? "Procfile.dev"
  return "bundle exec foreman start -f Procfile" if File.exists? "Procfile"
end

def try_rails
  "bundle exec rails s" if File.exists? "bin/rails"
end

def try_node
  if File.exists? "package.json"
    package = JSON.parse File.read "package.json"
    script = ((package["scripts"] || {}).keys & ["dev", "develop"]).first || "start"
    "npm run #{script}"
  end
end

puts (try_foreman or try_rails or try_node or 'echo "Failed to detect start command."')
