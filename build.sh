#/bin/bash

# add the output repository and rebase to it
USERNAME=eladb
PASSWORD=XXX
REPO=https://$USERNAME:$PASSWORD@github.com/eladb/test-eladb.github.com.git
git remote add out $REPO || exit 1
git fetch out || exit 1
git rebase out/master || exit 1

# now build the website
node_modules/.bin/jade *.jade || exit 1

# push to the output repo
git add . || exit 1
git commit -am 'build results' || exit 1
git push out master || exit 1

