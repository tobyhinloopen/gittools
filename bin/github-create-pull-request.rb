#!/usr/bin/env ruby

branch_name = `git rev-parse --abbrev-ref HEAD`
exit 1 unless branch_name =~ /^\d+/
issue_id = $~
title = `gh issue view #{issue_id} | head -n 1`

puts `gh pr create --draft --title "Fix #{title}" --body "Closes ##{issue_id}"`
