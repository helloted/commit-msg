#!/usr/bin/env bash

curl -L https://raw.githubusercontent.com/helloted/commit-msg/master/commit-msg-temp -o commit-msg
mkdir -p -m 777 .git/hooks
mv commit-msg .git/hooks/



