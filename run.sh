#!/usr/bin/env bash

if [ $1 == "python3" ];then
    curl -L https://raw.githubusercontent.com/helloted/commit-msg/master/commit-msg-python3 -o commit-msg
else
    curl -L https://raw.githubusercontent.com/helloted/commit-msg/master/commit-msg-python -o commit-msg
fi
mkdir -p -m 777 .git/hooks
mv commit-msg .git/hooks/
chmod +x  .git/hooks/commit-msg



