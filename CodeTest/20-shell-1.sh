#!/bin/env bash

#Name: 判断当前主机和远程主机是否互通

# 交互式定义变量，让用户自己决定 ping 那个主机
read -p "请输入你要ping的主机IP:" ip

# 使用ping程序判断主机是否互通
ping -c1 $ip &> /dev/null
if [ $? -eq 0 ];then
        echo "互通的"
    else
        echo "不互通"
fi


