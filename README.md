```sh
# Add gittools to PATH
PATH="/Users/hinloopen/Projects/Github/gittools/bin:$PATH"
alias gcb=github-create-branch.rb
alias gcpr=github-create-pull-request.rb
s() { $(start.rb) }

# P alias
p() { cd $(find ~/Projects -name ".git" -type d -maxdepth 3 | grep -i $1 | head -n 1)/.. }

# GH completion
eval "$(gh completion --shell zsh)"
```

```sh
gcb 659 # create branch
gcpr # create PR (after commit)
```

## HOOKS

```
git config --global core.hooksPath ~/Projects/gittools/hooks/
```
