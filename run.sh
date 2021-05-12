#!/usr/bin/env bash

if [ ! -d ".git" ]; then
  echo -e "\033[31m\033[01m\033[05mError:当前目录下没有.git文件夹，请在项目根目录下执行命令\033[0m"
  exit 8
fi

{
    if [[ $1 == "python2" ]];then
        curl -L https://raw.githubusercontent.com/helloted/commit-msg/master/commit-msg-python2 -o commit-msg
    else
        curl -L https://raw.githubusercontent.com/helloted/commit-msg/master/commit-msg-python3 -o commit-msg
    fi
    mkdir -p -m 777 .git/hooks
    mv commit-msg .git/hooks/
    chmod +x  .git/hooks/commit-msg
}&&{
    echo -e "\033[32m\033[01m\033[05m commit-msg success! \033[0m"
}








