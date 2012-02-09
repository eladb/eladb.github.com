#/bin/bash
git remote add out git@github.com:eladb/test-eladb.github.com.git || exit 1
git fetch out || exit 1
git rebase out/master || exit 1
node_modules/.bin/jade *.jade || exit 1

