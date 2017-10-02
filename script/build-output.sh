#!/usr/bin/env bash
set -e # halt script on error

bundle install
bundle exec jekyll build --config _config.yml,_config.4.1.1.yml --destination /4.1.1
