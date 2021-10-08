# Shell 学习笔记

### 一、 grep 工具

- #### 功能

  **_grep_** 是行过滤工具；用于根据关键字进行行过滤。

- #### 语法和选项

  - 语法

    ```shell
    grep [选项] '关键字'  文件名
    ```

  - 常见选项

    ```shell
    OPTIONS:

    -i: 不区分大小写
    -v: 查找不包含指定内容的行
    -w: 按单词搜索
    -o: 打印匹配关键字
    -c: 统计匹配到的次数
    -n: 显示行号
    -r: 逐层遍历目录查找
    -A: 显示匹配行及后面多少行
    -B: 显示匹配行前面多少行
    -C: 显示匹配行前后多少行
    -l: 只列出匹配的文件名
    -L: 列出不匹配的文件名
    -e: 使用正则匹配
    -E: 使用扩展正则匹配
    ^key: 以关键字开头
    key$: 以关键字结尾
    ^&: 匹配空行
    --color=auto: 可以将找到的关键字部分加上颜色的显示
    ```

- #### 实例

  说明: 下面的实例是使用文件 `CodeTest/01-shell.txt` 文件操作的。

  - 颜色

    题目: 查找 `CodeTest/01-shell.txt` 中所有的 A 字母。解答:

    使用 `grep` 查找，指令如下:

    ```shell
    grep --color:auto 'A' 01-shell.txt
    ```

  - 行

    题目: 查找 `CodeTest/01-shell.txt` 中所有的 A 字母在文件中哪一行。
    解答:

    使用 `grep -n` 查找，指令如下：

    ```shell
    grep -n 'A' 01=shell.txt
    ```

  - 忽略大小写

    题目：查找 `CodeTest/01-shell.txt` 中所有的 A、a 字母所在哪一行。 解答:
    使用：`grep -ni` 查找，指令如下：

    ```shell
    grep -ni 'a' 01-shell.txt
    ```

  - 以什么开头（^）和结尾（$）

    - 开头
      题目: 查找`CodeTest/01-shell.txt` 中所有的 AA 开头的行。 解答:
      使用 `grep '^AA` 查找，指令如下：

      ```shell
      grep '^AA' 01-shell.txt
      ```

    - 结尾
      题目: 查找`CodeTest/01-shell.txt` 中所有的 AA 结尾的行。 解答:
      使用 `grep 'AA$` 查找，指令如下：

      ```shell
      grep 'AA$' 01-shell.txt
      ```

  - 查找不包含

    题目：查找`CodeTest/01-shell.txt` 中所有不包含 AA 的行。 解答:
    使用 `grep -v` 查找，指令如下：

    ```shell
    grep -vi 'AA' 01-shell.txt
    ```

    或者

    ```shell
    grep -v -i 'AA' 01-shell.txt
    ```

  - 查找以什么的前几行、后几行、前后几行

    - 后几行

      题目：查找`CodeTest/01-shell.txt` 中所有以 AA 开头的后 1 行。 解答:
      使用 `grep -A 1` 查找，指令如下：

      ```shell
      grep -A 1 '^AA' 01-shell.txt
      ```

    - 前几行

      题目：查找`CodeTest/01-shell.txt` 中所有以 AA 开头的前 1 行。 解答:
      使用 `grep -B 1` 查找，指令如下：

      ```shell
      grep -B 1 '^AA' 01-shell.txt
      ```

    - 前后几行

      题目：查找`CodeTest/01-shell.txt` 中所有以 AA 开头的前后 1 行。 解答:
      使用 `grep -C 1` 查找，指令如下：

      ```shell
      grep -C 1 '^AA' 01-shell.txt
      ```

  - 按单词查找

    题目：查找`CodeTest/01-shell.txt` 中所有含有单词 `me` 的行。 解答:
    使用 `grep -w ` 查找，指令如下：

    ```shell
    grep -w 'me' 01-shell.txt
    ```

  - 打印匹配的文字

    题目：打印`CodeTest/01-shell.txt` 中包含的 `me`。 解答:
    使用 `grep -o ` 查找，指令如下：

    ```shell
    grep -o 'me' 01-shell.txt
    ```

  - 统计某个文字出现的次数

    题目：统计`CodeTest/01-shell.txt` 中包含的 `me` 个数。 解答:
    使用 `grep -c ` 查找，指令如下：

    ```shell
    grep -c 'me' 01-shell.txt
    ```

  - 查找空行

    题目：查找`CodeTest/01-shell.txt` 中空行行数。 解答:
    使用 `grep -n '^$' ` 查找，指令如下：

    ```shell
    grep -n '^$' 01-shell.txt
    ```

  - 总结
    如果有什么不懂的，可以使用 `man grep` 查询。

### 二、 cut 工具

- ##### 功能

  `cut` 是列截取工具，用户列的截取。

- ##### 语法和选项

  - 语法

    ```shell
    cut 选项  文件名
    ```

  - 选项

    ```shell
    -c：以字符为单位进行分割，截取
    -d: 自定义分隔符，默认为制表符
    -f: 与-d一起使用，指定截取那个区域
    ```

- #### 实例

  - 字符截取

    题目： 在文件 `CodeTest/02-shell.txt`中截取 1 到 7 列，解答：
    使用 `cut -c1-7` 分割，指令如下：

    ```shell
    cut -c1-7 02-shell
    ```

  - 以什么分割并获取那列

    题目： 在文件 `CodeTest/02-shell.txt`中以`b`分割并获取第 2 列，解答：
    使用 `cut -db -f2` 分割，指令如下：

    ```shell
    cut -db -f2 02-shell
    ```

  - 以什么分割并获取 2 到 3 列

    题目： 在文件 `CodeTest/02-shell.txt`中以`b`分割并获取第 2 列到第 3 列，解答：
    使用 `cut -db -f2,3` 分割，指令如下：

    ```shell
    cut -db -f2,3 02-shell
    ```

  - 从第几个字符取到结尾

    题目： 在文件 `CodeTest/02-shell.txt`中 从第 2 字符截取到结尾，解答：
    使用 `cut -c2-` 分割，指令如下：

    ```shell
    cut -c2- 02-shell
    ```

  - 从第 a 个字符截取到第 n 个字符

    题目： 在文件 `CodeTest/02-shell.txt`中 从第 2 字符截取到第 6 个字符，解答：
    使用 `cut -c2-6` 分割，指令如下：

    ```shell
    cut -c2-6 02-shell
    ```

### 三、sort 工具

- #### 功能

  `sort` 工具用于排序，它将文件的每一行作为一个单位，从首字符向后，依次按 ASCII 码值进行对比，最后按升序输出。

- #### 语法和选项

  - 语法
    ```shell
    sort 选项 文件名
    ```
  - 选项

    ```shell
    -u: 去除重复行
    -r: 降序排列，默认升序
    -o: 是将排序结果输出，类似于重定向符 >
    -n: 是按数字排序，默认按字母排序
    -t: 分隔符
    -k: 第N列
    -b: 忽略前导空格
    -R: 随机排序，每次运行都不相同
    ```

- #### 实例

  说明：文件 `CodeTest/03-shell.txt`

  - `-n 、-t 、-k -r` 的用法

    题目： 以数字排序用`:`分割的第 2 列的数据，并输入。解答：
    使用 升序：`sort -n -t -k` 、 降序：`sort -nr -t -k` 处理，指令如下：

    ```shell
    sort -n -t: -k2 03-shell.txt  // 升序
    ```

    或

    ```shell
    sort -nr -t: -k2 03-shell.txt  // 降序
    ```

  - 将排序结果输出到指定文件
    题目：排序文件以`:` 分割的第一列，并输入到 `temp.txt` 中。解答：
    使用 `sort -n -t: -k1 文件名 -o`处理，指令如下：

    ```shell
    sort -n -t: -k1 03-shell.txt -o temp.txt
    ```

  - 去除文件中重复行升序输出
    题目: 去除文件中重复的行。解答：
    使用 `sort -u` 处理，指令如下：

    ```shell
    sort -u 03-shell.txt
    ```

    随机排序输入，使用 `sort -R`,指令为：

    ```shell
    sort -uR 03-shell.txt
    ```

### 四、uniq 工具

- #### 功能

  用于去除连续的重复行。

- #### 语法和选项

  - 语法

    ```shell
    uniq 选项 文件名
    ```

  - 选项

    ```shell
    -i: 忽略大小写
    -c: 统计重复行次数
    -d: 只显示重复行
    ```

- #### 实例

  说明: 实例使用文件 `CodeTest/04-shell.txt`

  - 去除重复的行

    题目: 去除文件中重复的行。解答：
    使用 `uniq` 指令，指令如下：

    ```shell
    uniq 04-shell.txt
    ```

  - 计算重复行的次数

    题目： 统计文件中重复行的次数。解答：
    使用 `uniq -c` 指令，指令如下：

    ```shell
    uniq -c 04-shell.txt
    ```

  - 显示重复的行

    题目： 显示文件中重复的行。解答：
    使用 `uniq -d` 指令，指令如下：

    ```shell
    uniq -d 04-shell.txt
    ```

  - 显示重复行，并统计次数

    题目： 显示重复的行，并统计次数。解答：
    使用 `uniq -cd` 指令。指令如下：

    ```shell
    uniq -cd 04-shell.txt
    ```

### 五、tee 工具

- #### 功能

  用于从标准输入读取并写入到标准输出和文件，即：双向覆盖重定向（屏幕输出|文本输入）

- #### 语法和选项

  - 语法

    ```shell
    // 覆盖
    tee 文件
    // 追加
    tee -a 文件
    ```

  - 选项

    ```shell
    -a: 双向追加重定向
    ```

- #### 实例

  - 将标准输入写入到标准输出和文件

    题目： 将 **hello word** 标准输出并写入文件 **05-shell.txt**中。解答：
    使用 `tee 文件` 指令。指令如下：

    ```shell
    echo "hello word" | tee 05-shell.txt
    ```

  - 将标准输入写入到标准输出，并追加到指定文件中

    题目：将 **shell** 标准输出并追加到文件**05-shell.txt**文件中。解答：
    使用 `tee -a` 指令。指令如下：

    ```shell
    echo "shell" | tee -a 05-shell.txt
    ```

    注意：追加的内容在文件中另起一行。

### 六、diff 工具

- #### 功能

  **diff** 工具用于逐行比较文件的不同。
  注意：**diff** 描述两个文件的不同方式是告诉我们怎样更改第一个文件和第二个文件匹配。

- #### 语法和选项

  - 语法

    ```shell
    diff 选项 文件1 文件2
    ```

  - 选项

    ```shell
    -b: 不检查空格
    -B: 不检查空白行
    -i: 不检查大小写
    -w: 忽略所有的空格
    --normal: 正常格式显示， 默认
    -c: 上下文格式显示
    -u: 合并格式显示
    ```

- #### 实例

  说明：文件是 `06-shell_1.txt` 和 `06-shell_2.txt`

  - 比较两个文件是否相同

    文件 1 的内容是

    ```shell
    1 aaaa
    2 111
    3 hello world
    4 222
    5 333
    6 bbb
    ```

    文件 2 的内容是

    ```shell
    1 aaa
    2 hello
    3 111
    4 222
    5 bbb
    6 333
    7 world
    ```

    题目： 比较 **文件 1** 和 **文件 2** 是否相同。解答：
    使用 `diff` 指令。指令如下：

    ```shell
    diff 06-shell_1.txt 06-shell_2.txt
    ```

    结果如下:

    ```shell
    1c1,2 // 第一个文件要改变 1 -> 2行，将 aaaa 更换成 aaa 和 hello,才能和文件2的 1 -> 2 行相同。
    < aaaa
    ---
    > aaa
    > hello
    3d3 // 第一个文件的第 3 行要删除 hello world 才能和文件2的第 3 行匹配。
    < hello world
    5d4 // 第一个文件的第 5 行要删除 333 才能和文件2的第 4 行匹配。
    < 333
    6a6,7 // 第一个文件的第 6 行要添加 333 和 world 才能和文件2的第 6 -> 7 行匹配。
    > 333
    > world
    ```
