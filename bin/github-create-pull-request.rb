#!/usr/bin/env ruby

branch_name = `git rev-parse --abbrev-ref HEAD`
exit 1 unless branch_name =~ /^\d+/
issue_id = $~
title = `gh issue view #{issue_id} | head -n 1`.gsub(/^title:\s+|\n|\r/, "")

title = title.gsub /"/, "'"

puts "gh pr create --title \"Fix #{title}\" --body \"Closes ##{issue_id}\""
puts `gh pr create --title "Fix #{title}" --body "Closes ##{issue_id}"`
