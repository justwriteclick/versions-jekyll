#!/usr/bin/env bash
set -e # halt script on error

bundle exec jekyll build --config _config.yml,_config4.1.1.yml --destination /4.1.1
