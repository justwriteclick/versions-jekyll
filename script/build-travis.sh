#!/usr/bin/env bash
set -e # halt script on error

# Could you build a config file on the fly each time with a base url matching
# the name of the branch?
bundle exec jekyll build --config _config.yml
