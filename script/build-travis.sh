#!/usr/bin/env bash
set -e # halt script on error

for v in _current _4.1 _4.1.1
  do
    cp -r install-guide $v/install-guide
    cp -r release-notes $v/release-notes
  done

bundle exec jekyll build --config _config.yml
