#!/usr/bin/env bash

curl -L https://raw.githubusercontent.com/helloted/commit-msg/master/commit-msg-python -o commit-msg
mkdir -p -m 777 .git/hooks
mv commit-msg .git/hooks/
chmod +x  .git/hooks/commit-msg



