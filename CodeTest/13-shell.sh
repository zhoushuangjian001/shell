    #! /bin/env bash

    # Name: 小试牛刀
    # Desc: 文件操作

    # 1.删除文件 13-shell 中的所有文件
    rm -rf 13-shell/*

    # 2.创建目录 dir1-dir3
    mkdir 13-shell/dir{1..3}

    # 3.拷贝 ~/etc/hosts 到目录 dir1中
    cp /etc/hosts 13-shell/dir1

    # 4.输出完成时间
    echo "$(date +'%F %T')"

