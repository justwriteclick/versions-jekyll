#!/usr/bin/env bash
set -e # halt script on error

for v in _4.1 _4.1.1
  do
    cp _installguide $v/_installguide
    cp _pages $v/_pages
  done

bundle exec jekyll build --config _config.yml
