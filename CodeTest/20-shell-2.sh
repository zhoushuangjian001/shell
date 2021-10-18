#!/bin/env bash

#Name: 判断一个进程是否存在
read -p "请输入进程:" process
# 查看进程
pgrep $process &>/dev/null
# 判断
if [  $? -ne 0 ];then
    echo "进程不存在"
else
    echo "进程存在"
fi
