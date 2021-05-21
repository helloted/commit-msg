#!/usr/bin/env bash

if [ ! -d ".git" ]; then
  echo -e "\033[31m\033[01m\033[05mError:当前目录下没有.git文件夹，请在项目根目录下执行命令\033[0m"
  exit 8
fi

{
curl -L https://a-1258641320.cos.ap-guangzhou.myqcloud.com/commit-msg -o commit-msg
mkdir -p -m 777 .git/hooks
mv commit-msg .git/hooks/
chmod +x  .git/hooks/commit-msg
}&&{
    echo -e "\033[32m\033[01m\033[05m commit-msg success! \033[0m"
}








