#!/bin/env bash

read -p "请输入一个字符串:" str
if [ "$str" = "hello" ];then
    echo "word"
else
    echo "请输入hello!"
fi

