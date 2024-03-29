#!/usr/bin/env ruby

puts `git checkout master || git checkout main`
puts `git pull`

issue_id = ARGV[0]
title = issue_id + " " + `gh issue view #{issue_id} | head -n 1`.gsub(/^title:\s+|\n|\r/, "")
branch_name = title.downcase.gsub(/[^a-z0-9]+/i, "-").gsub(/^-|-$/, "")[0...60]

puts `git checkout -b "#{branch_name}"`
puts `git push`
puts `git branch --set-upstream-to origin/#{branch_name} #{branch_name}`
puts `git checkout #{branch_name}`
puts `git pull`
