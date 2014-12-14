################################################################################
#   Git versions
#   source:  http://stackoverflow.com/questions/4329816/rails-3-app-how-to-get-git-version-and-update-website
#
#   08.12.2013  ZT
#   08.12.2013  Last update (GIT_COMMIT_TIMESTAMP)
################################################################################
GIT_BRANCH           = `git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3`
GIT_COMMIT           = `git log --pretty=format:'%h' -n 1`
GIT_COMMIT_TIMESTAMP = Time.at `git log --pretty=format:'%ct' -n 1`.to_i
