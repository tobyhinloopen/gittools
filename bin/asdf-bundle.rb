#!/usr/bin/env ruby

ruby_version_version = File.read(".ruby-version").strip rescue ""

File.read("Gemfile").lines.find{ |line| line =~ /ruby "([^"]+)"/ } rescue ""
gemfile_version = $1

desired_version = gemfile_version ? gemfile_version : ruby_version_version

File.read(".tool-versions").lines.find{ |line| line =~ /ruby (\S+)/ } rescue ""
tool_versions_version = $1

if desired_version == ""
  puts "UNKNOWN DESIRED FUNCTION (Gemfile & .ruby-version don't contain ruby version)"
  return
end

return if tool_versions_version == desired_version

puts "RUBY VERSION CHANGED FROM #{tool_versions_version} TO #{desired_version}. UPDATING..."
puts `asdf plugin update ruby`
puts `asdf install ruby #{desired_version}`
puts `asdf local ruby #{desired_version}`
# now run `bundle`
