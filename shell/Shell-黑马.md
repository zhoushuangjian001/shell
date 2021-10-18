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

    - 默认格式显示

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

    - 上下文格式
      指令是 `diff -c 06-shell_1.txt 06-shell_2.txt`
      解决输出：

      ```shell

      *** 06-shell_1.txt      2021-10-08 14:59:35.000000000 +0800 // 三个 * 是代表文件1
      --- 06-shell_2.txt      2021-10-08 15:07:00.000000000 +0800 // 三个 - 是代表文件2
      ***************
      *** 1,6 **** // 表示文件1的 1 -> 6 行
      ! aaaa  // 感叹号表示需要修改
        111
      - hello world // 表示需要删除该行
        222
      - 333
        bbb
      --- 1,7 ----
      ! aaa  // 表示第一个文件改成该行才能和第二个文件匹配
      ! hello
        111
        222
        bbb
      + 333  // 表示第一个文件需要添加该行才能与第二个文件匹配
      + world
      ```

    - 合并文件格式
      指令是 `diff -u 文件1 文件2`
      结果输出：
      ```shell
      --- 06-shell_1.txt      2021-10-08 14:59:35.000000000 +0800
      +++ 06-shell_2.txt      2021-10-08 15:07:00.000000000 +0800
      @@ -1,6 +1,7 @@
      -aaaa  // 表示第一个文件删除 aaaa
      +aaa   // 表示第一个文件添加 aaa 和 hello
      +hello
      111
      -hello world  // 表示第一个文件删除 hello world
      222
      -333   //表示第一个文件删除该行
      bbb
      +333   // 表示第一个文件添加该行
      +world
      ```

  - 比较两个目录异同
    说明: `06-shell/test.txt` 和 `06-shell-1/test.txt` 两个目录，来测试。

    题目：比较目录 `06-shell` 和 `06-shell_1` 的异同。解答：
    使用 `diff` 指令。指令如下：

    ```shell
    diff 目录1 目录2
    ```

    目录的比较有两种情况：

    - 深度比较

      深度比较不光是比较目录还比较文件的内容。实例如下：

      ```shell
      diff 06-shell/test.txt 06-shell-1/test.txt
      1c1
      < 123456789
      ---
      > 1234567890
      ```

    - 浅度比较

      只比较目录这文件是否相同，不比较相同文件的内容。实例如下：

      ```shell
      Files 06-shell/test.txt and 06-shell-1/test.txt differ
      ```

- #### 应用

  要以一个文化为标准，去修改其他文件，并且修改的地方较多时，可以通过打补丁方式完成。实例如下：

  - 1> 先找出文件的不同之处，然后输出到一个文件中

    ```shell
    diff -uN 06-shell-dir 06-shell-cir > 06-shell-file.patch //
    ```

    说明：
    -u: 上下文模式
    -N: 将不存在的文件当成空文件

    输出结果: (06-shell-file.patch)

    ```shell
    --- 06-shell-dir	2021-10-09 11:46:59.000000000 +0800
    +++ 06-shell-cir	2021-10-09 11:46:18.000000000 +0800
    @@ -1,10 +1,9 @@
    123456
    654321
    -223344
    -556611
    112233
    +445566
    +654321
    +665544
    +332211
    113366
    224455
    -112233
    -654321
    -123456
    \ No newline at end of file
    ```

  - 2> 将不同内容打补丁到文件

    ```shell
    patch  06-shell-dir  06-shell-file.patch
    ```

    输出为：

    ```shell
    patching file 06-shell-dir
    ```

    文件 **06-shell-dir**的内容是：

    ```shell
    123456
    654321
    112233
    445566
    654321
    665544
    332211
    113366
    224455
    ```

  - 3> 测试验证

    ```shell
    diff 06-shell-dir 06-shell-cir
    ```

### 七、paste 工具

- #### 功能

  用于合并文件行

- #### 语法和选项

  - 语法

    ```shell
    paste 选项 文件1 文件2
    ```

  - 选项

    ```shell
    -d: 自定义间隔符，默认是 tab
    -s: 串行处理，非并行
    ```

- #### 实例

  说明：文件 `07-shell-1` 和文件 `07-shell-2` 两个文件。

  - 将两个文件行合并

    ```shell
    paste 07-shell-1 07-shell-2
    ```

    输出结果:

    ```shell
    110     550
    220     660
    330     770
    440
    ```

    上面默认分割是`tab`。

  - 将两个文件以 `:` 进行行合并

    ```shell
    paste -d: 07-shell-1 07-shell-2
    ```

    输出结果：

    ```shell
    110:550
    220:660
    330:770
    440:
    ```

  - 将文件串行合并

    ```shell
    paste -s 07-shell-1 07-shell-2
    ```

    输出结果：

    ```shell
    110     220     330     440550  660     770
    ```

### 八、 tr 工具

- #### 功能

  用于字符的转换、替换、删除。
  应用场景：

  1. 删除文件中控制字符
  2. 进行字符转换

- #### 语法和选项

  - 语法

    ```bash
    // 将一个命令的结果交给 tr 处理，其中 str1 用于查询， str2 用于转换处理
    commands | tr  'str1' 'str2'

    // tr 处理的内容来自文件， 要使用标准输入 '<'
    tr 'str1' 'str2' < filename

    // 匹配 str1 进行相关操作，如删除操作
    tr options  'str1' < filename
    ```

  - 选项

    ```bash
    -d: 删除输入匹配的所有字符
    -s: 删除所有重复出现字符，只保留一个
    ```

  - 匹配字符串

    | 字符串           | 含义                                                                   |
    | ---------------- | ---------------------------------------------------------------------- |
    | a-z 或 [:lower:] | 匹配所有小写字母                                                       |
    | A-Z 或 [:upper:] | 匹配所有大写字母                                                       |
    | 0-9 或 [:digit:] | 匹配所有数字                                                           |
    | [:alnum:]        | 匹配所有数字和字母                                                     |
    | [:alpha:]        | 匹配所有字母                                                           |
    | [:blank:]        | 匹配所有水平空白                                                       |
    | [:punct:]        | 匹配所有标点符号                                                       |
    | [:space:]        | 匹配所有水平和垂直的空格                                               |
    | [:cntrl:]        | 匹配所有控制字符例如：1. \f 走行换页 2.\n 换行 3. \r 回车 4. \t tab 键 |

- #### 实例

  说明: 要操作的文件为 `08-shell`
  内容是:

  ```bash
  1a2b3c4d5f
  AA11BB33cc
  abc123cdf
  123word123
  789abcpoww
  7:09 `  ui
          s
  s        we
  123abcd
  ```

  - 将文件中的小写字母替换成大写字母

    ```bash
    tr '[a-z]' 'A-Z' < 08-shell
    ```

    输出结果为:

    ```bash
    1A2B3C4D5F
    AA11BB33CC
    ABC123CDF
    123WORD123
    789ABCPOWW
    7:09 `  UI
            S
    S        WE
    123ABCD
    FGH345
    ```

  - 将文件中的数字全部替换成 @ 符号

    ```bash
    tr '0-9' '@' < 08-shell
    ```

    输出结果为：

    ```bash
    @a@b@c@d@f
    AA@@BB@@cc
    abc@@@cdf
    @@@word@@@
    @@@abcpoww
    @:@@ `  ui
            s
    s        we
    @@@abcd
    fgh@@@
    ```

  - 将文件中的 ：和 ` 号替换成 ¥

    ```bash
    tr ':`' '¥' < 08-shell
    ```

    输出结果为:

    ```bash
    1a2b3c4d5f
    AA11BB33cc
    abc123cdf
    123word123
    789abcpoww
    7¥09 ¥  ui
            s
    s        we
    123abcd
    fgh345
    ```

  - 删除文件中的所有数字

    ```bash
    tr -d '0-9' < 08-shell
    ```

    输出结果:

    ```bash
    abcdf
    AABBcc
    abccdf
    word
    abcpoww
    : `     ui
            s
    s        we
    abcd
    fgh
    ```

  - 去除文件连续重复字符，保留一个

    ```bash
    tr -s 'a-z' < 08-shell
    ```

    输出结果为：

    ```bash
    1a2b3c4d5f
    AA11BB33c
    abc123cdf
    123word123
    789abcpow
    7:09 `  ui
            s
    s        we
    123abcd
    fgh345
    ```

### 九、常用通配字符

- #### 常用通配符

  | 符号            | 含义                          |
  | --------------- | ----------------------------- |
  | \*              | 匹配 0 个和多个字符           |
  | ？              | 匹配任意单个字符              |
  | [list]          | 匹配 list 中任意单个字符      |
  | {str1,str2,...} | 匹配 str1,str2 或者更多字符串 |

- #### 实例

  说明: 在目录 09-shell 中包含 15 个文件， file1、file2、file1..file12.jpg。生成指令为：

  ```bash
  touch file1 file2 file{1..12}.jpg
  ```

  输出结果为：

  ```bash
  -rw-r--r--  1 network  staff  0 10 12 11:13 file1
  -rw-r--r--  1 network  staff  0 10 12 11:13 file1.jpg
  -rw-r--r--  1 network  staff  0 10 12 11:13 file10.jpg
  -rw-r--r--  1 network  staff  0 10 12 11:13 file11.jpg
  -rw-r--r--  1 network  staff  0 10 12 11:13 file12.jpg
  -rw-r--r--  1 network  staff  0 10 12 11:13 file2
  -rw-r--r--  1 network  staff  0 10 12 11:13 file2.jpg
  -rw-r--r--  1 network  staff  0 10 12 11:13 file3.jpg
  -rw-r--r--  1 network  staff  0 10 12 11:13 file4.jpg
  -rw-r--r--  1 network  staff  0 10 12 11:13 file5.jpg
  -rw-r--r--  1 network  staff  0 10 12 11:13 file6.jpg
  -rw-r--r--  1 network  staff  0 10 12 11:13 file7.jpg
  -rw-r--r--  1 network  staff  0 10 12 11:13 file8.jpg
  -rw-r--r--  1 network  staff  0 10 12 11:13 file9.jpg
  ```

  - `*` 通配
    匹配所有的文件，指令是:

    ```bash
    ls -l file*
    ```

    输出结果为：

    ```bash
    -rw-r--r--  1 network  staff  0 10 12 11:13 file1
    -rw-r--r--  1 network  staff  0 10 12 11:13 file1.jpg
    -rw-r--r--  1 network  staff  0 10 12 11:13 file10.jpg
    -rw-r--r--  1 network  staff  0 10 12 11:13 file11.jpg
    -rw-r--r--  1 network  staff  0 10 12 11:13 file12.jpg
    -rw-r--r--  1 network  staff  0 10 12 11:13 file2
    -rw-r--r--  1 network  staff  0 10 12 11:13 file2.jpg
    -rw-r--r--  1 network  staff  0 10 12 11:13 file3.jpg
    -rw-r--r--  1 network  staff  0 10 12 11:13 file4.jpg
    -rw-r--r--  1 network  staff  0 10 12 11:13 file5.jpg
    -rw-r--r--  1 network  staff  0 10 12 11:13 file6.jpg
    -rw-r--r--  1 network  staff  0 10 12 11:13 file7.jpg
    -rw-r--r--  1 network  staff  0 10 12 11:13 file8.jpg
    ```

  - `?` 通配
    匹配文件 file1 和 file2 ,指令是:

    ```bash
    ls -l file?
    ```

    输出结果为:

    ```bash
    -rw-r--r--  1 network  staff  0 10 12 11:13 file1
    -rw-r--r--  1 network  staff  0 10 12 11:13 file2
    ```

  - `[list]` 通配
    匹配文件 file1-file9.jpg ,指令是:

    ```bash
    ls -l file[1-9].jpg
    ```

    输出结果为:

    ```bash
    -rw-r--r--  1 network  staff  0 10 12 11:13 file1.jpg
    -rw-r--r--  1 network  staff  0 10 12 11:13 file2.jpg
    -rw-r--r--  1 network  staff  0 10 12 11:13 file3.jpg
    -rw-r--r--  1 network  staff  0 10 12 11:13 file4.jpg
    -rw-r--r--  1 network  staff  0 10 12 11:13 file5.jpg
    -rw-r--r--  1 network  staff  0 10 12 11:13 file6.jpg
    -rw-r--r--  1 network  staff  0 10 12 11:13 file7.jpg
    -rw-r--r--  1 network  staff  0 10 12 11:13 file8.jpg
    -rw-r--r--  1 network  staff  0 10 12 11:13 file9.jpg
    ```

  - `{str1,str2...}` 通配
    匹配文件 file11.jpg、file10.jpg,指令是:
    ```bash
    ls -l file{10,11,12}.jpg
    ```
    结果输出:
    ```bash
    -rw-r--r--  1 network  staff  0 10 12 11:13 file10.jpg
    -rw-r--r--  1 network  staff  0 10 12 11:13 file11.jpg
    -rw-r--r--  1 network  staff  0 10 12 11:13 file12.jpg
    ```

### 十、 引号的作用

- #### 种类

  1. 双引号
  2. 单引号
  3. 反撇号

- #### 种类介绍

  - 双引号

    把引号的内容当成整体看待，允许 $ 符号引用其他变量

  - 单引号

    会把引号的内容，当成整体看待，不允许引用其他变量

  - 反撇号

    反撇号和 $() 符号一样，引号或者括号里面的命令优先执行，如果存在嵌套反撇号不可使用。

### 十一、脚本基本写法

脚本的基本写法。

- #### 脚本第一行

  `#!` 指定解释器，比写。

- #### 脚本第二部分

  使用 `#` 进行注释说明，对脚本基本信息描述。例如：

  ```bash
  #! /bin/env bash

  # 以下内容对脚本信息描述
  # Name: 名字
  # Desc: 描述
  # Path: 存放路径
  # Usage: 用法
  # Update: 更新时间

  commands
  ```

- #### 脚本第三部分

  脚本要实现功能的代码。

### 十二、 脚本的执行

- #### 标准执行方式

  ```bash
  chmod +x 文件.sh
  ```

  标准脚本的执行必须有可执行权限。

- #### 非标准执行方式

  直接在命令行中指定解释器执行。例如:

  ```bash
  bash 文件.sh

  sh 文件.sh

  dash 文件.sh

  source 文件.sh
  ```

  注意:

  ```bash
  -x: 常用于脚本的排错
  -n: 检查脚本的语法是否有错
  ```

  - `-x` 的执行输出
    指令 `sh -x 12-shell.sh`, 输出结果是:
    ```bash
    + echo 'hello world'
    hello world
    + echo 'hello world'
    hello world
    ```
  - `-n` 的语法检查
    执令 `sh -n 12-shell.sh`, 输出结果是:

    ```bash
    // 12-shell.sh 的内容
     1  #! /bin/env bash
     2
     3  # 注释
     4  # Name: 第一个脚本
     5  # Desc: 打印 hello world
     6
     7  echo "hello world"
     8  echo "hello world"
     9
    10  if 2 > 1
    11  else
    12      echo "测试"
    13  endif
    14

    // 输出结果
    12-shell.sh: line 11: syntax error near unexpected token `else'
    12-shell.sh: line 11: `else'
    ```

### 十三、小试牛刀

- #### 题目

  1. 删除目录 `13-shell` 中的所有文件
  2. 然后再 `13-shell` 目录中创建 3 个目录，分别是 dir1-dir3.
  3. 拷贝 /etc/host 文件到 dir1 目录里
  4. 最后打印任务完成时间

- #### 解答

  脚本的指令：

  ```bash
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
  ```

  指令 `sh -x 13-shell.sh`的输出是:

  ```bash
  + rm -rf 13-shell/dir1 13-shell/dir2 13-shell/dir3
  + mkdir 13-shell/dir1 13-shell/dir2 13-shell/dir3
  + cp /etc/hosts 13-shell/dir1
  ++ date '+%F %T'
  + echo '2021-10-12 17:19:07'
  2021-10-12 17:19:07
  ```

### 十四、变量

- #### 变量是什么

  变量是用来保存临时数据的，该数据是可以变化的。

- #### 什么时候需要定义变量

  - 如果某个内容需要多次使用，并且在代码中重复出现，那么可以使用变量表示该内容。这样在修改内容的时候，仅需要修改变量的值。

  - 在代码运作的过程中，可能把某些命令的结果保存起来，后续代码需要使用这些结果，就可以直接使用这个变量。

- #### 变量如何定义

  ```bash
  变量名=变量值
  ```

  举例说明:

  ```bash
  A=hello  // 定义变量
  echo $A  // 调用变量A，需要付费，美元
  echo ${A} // 还可以这样调用，同样要付钱

  A=world  // 变量是可变的
  echo $A  // 不管变量是什么，只要调用都要给钱
  unset A  // 取消变量
  ```

- #### 变量名定义规则

  - 变量名区分大小写，例如：
    ```bash
    A=hello
    a=world
    echo $A
      hello
    echo $a
      world
    ```
  - 变量名不能使用特殊符号

    ```bash
    ?B=11
    // 报错: zsh: no matches found: ?B=11
    ```

  - 变量名不能以数字开头
    ```bash
    1B=11
    // 报错: zsh: command not found: 1B=11
    ```
  - 等号两边不能有空格

    ```bash
    A= 22
    // 报错: zsh: command not found: 22

    A =22
    // 报错: zsh: 22 not found
    ```

- #### `$A 和 ${A}` 的区别

  `$A 和 ${A}` 这两个都能获取变量 `A` 的内容，但是要获取 `A` 内容的部分内容就需要使用 `${A}` 进行切片获取，如下：

  ```bash
  A=12345
  echo ${A:2:3} // 切片开始字符角标是 0，其中 2 指的是 `12345` 中的 3。
  // 输出：345
  ```

- #### 将指令结果赋值变量

  将获取的主机名，赋值给变量 A, 指令如下:

  ```bash
  A=`hostname`
  echo $A
  ```

  或者

  ```bash
  A=$(hostname)
  echo $A
  ```

### 十五、交互式变量

- #### 功能

  让用户自己给变量赋值，比较灵活

- #### 语法

  `read 选项 变量名`

  - 常用选项

    ```bash
    -p: 定义用户提示信息
    -n: 定义字符数（限制变量值的长度）
    -s: 不显示用户输入的内容
    -t: 定义超时时间，默认单位为秒（限制用户输入变量值的时间）
    ```

- #### 实例

  - 基础用法
    ```bash
    read name
    输入: aa
    echo $name
    输出: aa
    ```
  - 提示输入

    ```bash
    read -p "输入名字:" name
      输入名字: aa
    echo $name
      aa
    ```

  - 隐藏用户输入

    ```bash
    read -s name
    // 输入: 123
    echo $name
       123
    ```

  - 限制用户输入时间

    ```bash
    read -t 2 name
    // 2 秒不输入，直接退出
    ```

  - 从文件中读取变量值
    文件 `15-shell` 内容为 `10.01.12.1`。
    ```bash
    read -p "获取地址:" ip < 15-shell
    echo $ip
      10.01.12.1
    ```

### 十六、定义有类型的变量

- #### 作用

  给变量一些限制，固定变量的类型

- #### 语法

  `declare 选项 变量名=变量值`

  - 选项

    ```bash
    -i: 是将变量看成整数， 例如: declare -i A=123
    -r: 定义只读变量，    例如: declare -r N=read
    -a: 定义普通数组，查看普通数组
    -A: 定义关联数组，查看关联数组
    -x: 将变量通过环境导出， declare -x A=123 等价于 export A=123
    ```

### 十七、变量的分类

- #### 本地变量

  当前用户自定义的变量，只在当前进程中有效，其他进程中无效。例如：

  ```bash
  A=hello
  echo $A
  // 输出 hello
  su user01
  echo $A
  // 无输出
  ```

- #### 环境变量

  环境变量当前进程有效，可以被其子线程调用。

  - env 查看当前用户的环境变量
  - set 查看当前用户的所有变量（临时变量和环境变量）
  - export 变量名=变量值

### 十八、运算

- #### 四则运算

  shell 只能进行简单的整数运算。运算内容： `+ 、-、*、/、%`。

  - 四则运算符号

    | 表达式 | 举例              |
    | ------ | ----------------- |
    | $(())  | echo $((1+3))     |
    | $[]    | echo $[1-3]       |
    | expr   | expr 10 / 4       |
    | let    | n=1; let n+=1     |
    | 次幂   | n=2; let n=n\*\*3 |

  - 小数计算 bc
    `bc` 是计算程序，帮组我们计算。

    ```bash
    echo 1+1.5|bc
    ```

- #### i++ 和 ++i 区别

  - 针对于变量两个无区别

    ```bash
    i=1
    let i++
    echo $i
    // 输出 2

    j=1
    let ++j
    echo $j
    // 输出 2
    ```

  - 对表达式有影响

    ```bash
    i=1;j=1
    let x=i++
    echo $x  // 1
    echo $i  // 2
    let y=++j
    echo $y // 2
    let $j  // 2
    ```

    注意： `i++` 先赋值，在运算；`++j` 先运算，在赋值

### 十九、条件判断

- #### 语法

  ```bash
  格式1: test 条件表达式
  格式2: [ 条件表达式 ]
  格式3: [[ 条件表达式 ]]
  ```

  说明：

  1. `[ 条件表达式 ]`: 这种中括号和条件表达式之间要进行空格，必须的。
  2. `[[ 条件表达式 ]]`: 这种中括号和条件表达式之间要进行空格，必须的。

- #### 条件判断参数

  | 判断参数 | 含义                                        |
  | -------- | ------------------------------------------- |
  | -e       | 判断文件是否存在（任意类型文件）            |
  | -f       | 判断文件是否存在， 且是一个普通的文件       |
  | -d       | 判断文件是否存在， 并且是一个目录           |
  | -L       | 判断文件是否存在， 并且是一个软连接文件     |
  | -b       | 判断文件是否存在， 并且是一个块设备文件     |
  | -S       | 判断文件是否存在， 并且是一个套接字文件     |
  | -c       | 判断文件是否存在， 并且是一个字符块设备文件 |
  | -p       | 判断文件是否存在， 并且是一个命名管道文件   |
  | -s       | 判断文件是否存在， 且是一个非空文件         |

- #### 实例

  文件 `19-shell` 中包含下面文件，如下：

  ```bash
  drwxr-xr-x  2 network  staff  64 10 13 16:35 dir1
  drwxr-xr-x  2 network  staff  64 10 13 16:35 dir2
  -rw-r--r--  1 network  staff  13 10 13 16:36 file1
  -rw-r--r--  1 network  staff   0 10 13 16:35 file2
  -rw-r--r--  1 network  staff   0 10 13 16:35 file3
  ```

  - 判断 file1 文件是否存在

    ```bash
    // 使用$?查看结果
    test -e file1;echo $?
    ```

    输出为 0 , 文件存在。

  - 判断目录是否存在

    ```bash
    [ -d dir1 ];echo $?
    ```

    输出为 0 , 目录存在。

  - 判断是否是软连接文件

    - 准备
      使用 `ln -s` 为文件 `file1` 创建软连接文件 `test1`,指令如下：

      ```bash
      ln -s file1 test1
      ```

      查看 `19-shell`的内容为：

      ```bash
      drwxr-xr-x  2 network  staff  64 10 13 16:35 dir1
      drwxr-xr-x  2 network  staff  64 10 13 16:35 dir2
      -rw-r--r--  1 network  staff  13 10 13 16:36 file1
      -rw-r--r--  1 network  staff   0 10 13 16:35 file2
      -rw-r--r--  1 network  staff   0 10 13 16:35 file3
      lrwxr-xr-x  1 network  staff   5 10 13 16:58 test1 -> file1
      ```

    - 判断
      判断文件 `test1` 是否是软链接文件，指令如下：

      ```bash
      [ -L test1 ];echo $?
      ```

      输出结果为 0， `test1` 是软连接文件。

  - 判断 `test1` 是否是普通文件

    ```bash
    [[ -f test1 ]];echo $?
    ```

    输出结果为 1， `test1` 不是一个普通文件。

  - 判断文件 `dir1` 不存在

    ```bash
    [ ! -d dir1 ];echo $?
    ```

    输出结果为 1, 文件存在。

- #### 判断文件权限

  | 判断参数 | 含义                        |
  | -------- | --------------------------- |
  | -r       | 当前用户对其是否可读        |
  | -W       | 当前用户对其是否可写        |
  | -x       | 当前用户对其是否可以执行    |
  | -u       | 是否有 suid, 高级权限冒险位 |
  | -g       | 是否有 sgid, 高级权限限制位 |
  | -k       | 是否有 t 位，高级权限粘滞位 |

- #### 判断文件新旧

  说明: 文件的新旧指的是文件的修改时间

  | 判断参数        | 含义                                                             |
  | --------------- | ---------------------------------------------------------------- |
  | file1 -nt file2 | 比较 file1 是否比 file2 新                                       |
  | file1 -ot file2 | 比较 file1 是否比 file2 旧                                       |
  | file1 -ef file2 | 比较文件是否是同一个文件或则用于判断硬链接，是否指向同一个 inode |

  判断实例如下:

  - 比较文件 `file1` 和 `flie2` 的新

    ```bash
    [ file1 -nt file2 ]; echo $?
    ```

    输出结果为 0， `file1` 比 `file2` 新。

  - 比较文件 `file1` 和 `file2` 的旧

    ```bash
    [ file1 -ot file2 ];echo $?
    ```

    输出结果为 1， `file1` 没有 `file2` 旧。

  - 比较文件 `file1` 和 `file2` 是否相同
    ```bash
    [ file1 -ef file2 ]; echo $?
    ```
    输出结果为 1, `file1` 和 `file2` 文件不相同。

- #### 判断整数

  | 判断参数 | 含义     |
  | -------- | -------- |
  | -eq      | 相等     |
  | -ne      | 不等     |
  | -gt      | 大于     |
  | -lt      | 小于     |
  | -ge      | 大于等于 |
  | -le      | 小于等于 |

  - 实例

    ```bash
    [ 1 -eq 2]; echo $?
    // 输出 1

    [ 1 -ne 2 ]; echo $?
    // 输出 0
    ```

- #### 判断字符串

  | 判断参数     | 含义                                             |
  | ------------ | ------------------------------------------------ |
  | -z           | 判断是否为空字符串，字符串长度为 0 则成立        |
  | -n           | 判断是否为非空字符串，字符串长度不为 0，泽则成立 |
  | str1=str2    | 判断字符串是否相等                               |
  | str1 != str2 | 判断字符串是否不等                               |

  - 实例

    ```bash
    test -z 'hello'; echo $?
    // 输出 1

    test -z ''; echo $?
    // 输出 0

    test -n 'hello'; echo $?
    // 输出 0

    test -n ''; echo $?
    // 输出 1

    test 'A' = 'B';echo $?
    // 输出 1
    ```

- #### 多重条件判断

  | 判断符号    | 含义   |
  | ----------- | ------ |
  | -a 和 &&    | 逻辑与 |
  | -o 和 \| \| | 逻辑或 |

  特殊说明:

  - `&&` 前面的表达式为真，才会执行后面的代码
  - `||` 前面的表达式为假，才能执行后面的代码
  - `；` 只用于分割命令或表达式

  举例：

  ```bash
  // -a 和 &&
  [ 1 -eq 1 -a 1 -ne 0 ]
  [ 1-eq 1 ] && [ 1 -ne 0]

  // -o 和 ||
  [ 1 -eq 1 -o 1 -ne 1 ]
  [ 1 -eq 1 ] || [ 1 -ne 1 ]

  ///  多个判断
  [ 1 -eq 1 ] && echo '相等' || echo "不等"
  // 输出 相等

  [ 1 -ne 1 ] && echo "不等"
  // 无输出

  [ 1 -eq 2 ] && echo AAA || echo BBB && echo CCC
  // 输出 BBB CCC
  ```

- #### 类似 C 语言条件判断

  注意: 在 `(())` 中， `=` : 表示赋值 `==` : 表示判断

  ```bash
  (( 1==1 )); echo $?
  // 输出 0

  (( 1!=2 ));echo $?
  // 输出 0

  (( 1<3 )); echo $?
  // 输出 0
  ```

- #### [] 和 [[]] 区别

  区别是: `[]` 在字符串判断时必须使用双引号，`[[]]` 可以不使用。例如:

  ```bash
  A=word
  [ $A = "hello" ];echo $?
  [[ $A = hello ]];echo $?
  // 输出 1
  ```

### 二十、流程控制

- #### if 结构

  ```bash
  // 第一种
  if [ 条件 ];then
    command
    command
  fi

  // 第二种
  if test 条件;then
    command
    command
  fi

  // 第三种
  if [[ 条件 ]];then
    command
    command
  fi
  ```

- #### if...else...fi 结构

  ```bash
  if [ 条件 ];then
      command
    else
      command
  fi
  ```

- #### if...elif...else 结构

  ```bash
  if [ 条件 ];then
      command
    elif
      command
    else
      command
  fi
  ```

- #### 实例

  - 例子 1 (20-shell.sh)
    让用户输入字符串，如果输入的是 `hello`,打印 `world`。否者打印请输入 `hello`。代码：

    ```bash
    #!/bin/env bash

    read -p "请输入一个字符串:" str
    if [ "$str" = "hello" ];then
        echo "word"
    else
        echo "请输入hello!"
    fi
    ```

  - 例子 2 (20-shell-1.sh)
    判断当前主机和远程主机是否 `ping` 通。实例：

    ```bash
    #!/bin/env bash

    #Name: 判断当前主机和远程主机是否互通

    # 交互式定义变量，让用户自己决定 ping 那个主机
    read -p "请输入你要ping的主机IP:" ip

    # 使用ping程序判断主机是否互通
    // -c1 是控制次数
    // /dev/null 释放结果
    ping -c1 $ip &> /dev/null
    if [ $? -eq 0 ];then
            echo "互通的"
        else
            echo "不互通"
    fi
    ```

  - 例子 3 (20-shell-2.sh)
    判断 `web` 服务器中 `httpd` 进程是否存在。实例：

    ```bash
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
    ```
