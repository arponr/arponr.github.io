#!/bin/bash

cd ~/Documents/code/arponr.com &&
jekyll build &&
git add --all . &&
git commit -a &&
git branch -D master &&
git checkout -b master &&
git filter-branch --subdirectory-filter _site/ -f &&
git checkout source &&
git push --all --force
