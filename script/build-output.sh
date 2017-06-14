#!/usr/bin/env bash
set -e # halt script on error

bundle exec jekyll build --config _config.yml
bundle exec jekyll build --config _4.1.1.yml
