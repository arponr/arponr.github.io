#!/bin/bash

cd ~/Documents/code/site &&
jekyll build &&
git commit -a &&
git branch -D master &&
git checkout -b master &&
git filter-branch --subdirectory-filter _site/ -f &&
git checkout source &&
git push --all --force

