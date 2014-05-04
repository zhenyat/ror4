################################################################################
#   Git versions
#   source:  http://stackoverflow.com/questions/4329816/rails-3-app-how-to-get-git-version-and-update-website
#
#   08.12.2013  ZT
################################################################################
GIT_BRANCH = `git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3`
GIT_COMMIT = `git log --pretty=format:'%h' -n 1`
GIT_COMMIT_TIMESTAMP = `git log --pretty=format:'%ct' -n 1`