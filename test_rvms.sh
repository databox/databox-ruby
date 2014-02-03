#!/usr/bin/env bash



declare -a RVMS=(\
  'ruby-1.9.3-p484@databox' \
  'ruby-2.0.0-p353@databox' \
)

for r in "${RVMS[@]}"; do
  set -o verbose
  echo "Testing $r"
  rvm $r exec bundle exec rspec --fail-fast --format=progress
done
