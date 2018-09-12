# Print the name of the git working tree's root directory
# https://stackoverflow.com/questions/957928/is-there-a-way-to-get-the-git-root-directory-in-one-command/38852055#38852055
function git_root() {
  local root first_commit
  # git displays its own error if not in a repository
  root=$(git rev-parse --show-toplevel) || return
  if [[ -n $root ]]; then
    echo $root
    return
  elif [[ $(git rev-parse --is-inside-git-dir) = true ]]; then
    # We're inside the .git directory
    # Store the commit id of the first commit to compare later
    # It's possible that $GIT_DIR points somewhere not inside the repo
    first_commit=$(git rev-list --parents HEAD | tail -1) ||
      echo "$0: Can't get initial commit" 2>&1 && false && return
    root=$(git rev-parse --git-dir)/.. &&
      # subshell so we don't change the user's working directory
    ( cd "$root" &&
      if [[ $(git rev-list --parents HEAD | tail -1) = $first_commit ]]; then
        pwd
      else
        echo "$FUNCNAME: git directory is not inside its repository" 2>&1
        false
      fi
    )
  else
    echo "$FUNCNAME: Can't determine repository root" 2>&1
    false
  fi
}


source ~/.zsh/powerlevel9k/powerlevel9k.zsh-theme
