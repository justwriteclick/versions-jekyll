#!/bin/bash
# Builds current committed master branch from GitHub to gh-pages, replacing everything in gh-pages

# Variables
installed="bundle"

# Get the latest commit SHA in sourcedir branch
last_SHA=( $(git log -n 1 --pretty=oneline) )
# The name of the temporary folder will be the
#   last commit SHA, to prevent possible conflicts
#   with other folder names.
clone_dir="/tmp/clone_$last_SHA/"

# Make sure Jekyll is installed locally
if ! gem list $installed; then
        echo "You do not have the pre-reqs installed. Refer to the README for requirements."
        exit 0
fi

# Create directory to hold temporary clone
mkdir $clone_dir
cd $clone_dir
# Clone a clean copy of master from GitHub
git clone git@github.com:justwriteclick/versions-jekyll.git
cd versions-jekyll
# Variable for temporary build output files location
build_dir="/tmp/build_$last_SHA/"
# Check out individual version branches and build those with the gh-pages script to a single build_dir
bundle exec jekyll build --config _config.yml -d /tmp/build_$last_SHA/ > /dev/null 2>&1
      if [ $? = 0 ]; then
        echo "Jekyll build with master branch successful"
      else
        echo "Jekyll build with master branch failed"
        exit 1
      fi
# Rather than hardcoding branch names, use git to list them and go through all
# stable branches
for v in stable/4.1 stable/4.1.1
  do
    git checkout $v
    for i in _4.1.yml _4.1.1.yml
      do
        echo "Build with $i file"
        bundle exec jekyll build --config $i -d /tmp/build_$last_SHA/ > /dev/null 2>&1
        if [ $? = 0 ]; then
          echo "Jekyll build with $1 successful"
        else
          echo "Jekyll build with $1 failed"
          exit 1
        fi
      done
  done
# Check out origin gh-pages branch
echo "Checking out gh-pages branch"
git checkout gh-pages
# Copy all the built files from where it was built to
echo "Copy build dir"
cp -r $build_dir .
echo "Adding files to commit"
# Because this is a clean clone check out, add all files
git add .
# Provides a publishing date stamp
publishdate=`date +%m-%d-%Y`
echo $publishdate
echo $last_SHA
# Commit the changed files
echo "Committing files"
git commit -a -m "Publishing master to GitHub Pages on $publishdate"
echo "Files committed, pushing to GitHub Pages."
git push origin gh-pages
echo "Push complete. Check https://justwriteclick.github.io/versions-jekyll/ for updates."
echo "Moving built files so that you can troubleshoot if needed."
mkdir -p /tmp/archive/
mv $clone_dir /tmp/archive/$last_SHA
rm -rf /tmp/$build_dir/
echo "Switch to the /tmp/archive/ directory and look for the directory "
echo "named with the latest commit SHA, "
echo "found by running git log -n 1 --pretty=oneline."


