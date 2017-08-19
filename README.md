k-vim
=======================
[TOC]
# Vim 常用技巧
## 一、移动
### [基本移动]

```vim
1.  h j k l              # 上下左右
2.  ^ or 0               # 到行首和到行首第一个非空字符
3.  $ or g_              # 到行尾
4.  H or L               # 到行首和行尾
5.  f/F or t/T           # 行内移动到指定字符或指定字符前一位
```
### [文内移动]

```vim
1.  gg or G              # 到文件头和尾
2.  Ctrl + u/d           # 上下滚动文件< 20 line >
3.  Ctrl + b/f           # 上一页和下一页
4.  zt / zz / zb         # 屏幕顶部 中部 底部
5.  :n                   # 命令模式下跳到n行
6.  nG                   # 普通模式下跳到n行
7.  Ctrl + e/y            # 向下/向上滚动2行 vim中配置
```
### [单词移动]

```vim
1.  w / W               # 下一个单词的首位 大写指非空的连续字符 < 包扩标点符号 >
2.  e / W               # 到当前单词的尾部 大写规则同W
2.  b / B               # 上一个单词的首位 大写规则同W
```
![](media/14915816176056/14916787837946.jpg)

### [常用跳转]

```vim
1.  '' / ``            # 两个单引号和两个反引号 跳回来的地方(最近两个位置跳转)
2.  '.                 # 跳到最近一次修改的地方
3.  Ctrl + o/i         # 跳转较旧位置或者跳转较新位置
```

## 二、编辑
### 编辑模式
#### 普通编辑
```vim
1.  i / a              # 当前位置前/后开启编辑模式
2.  I / A              # 行首 / 行尾开启编辑模式
3.  o / O              # 下一行/上一行
4. 
```
#### 文本对象
* 命令 + 范围 + 对象

```vim
1.  命令               # d=删除 v=选择 c=替换 y=复制 等
2.  范围               # i=inside  a=around
3.  对象               # w=word  s=sentence  p=paragraph  成对的符号  t=tag标签
```

* 文本对象增强

```vim
1.  vim-textobj-user    # 添加自定义文本对象 kana/vim-textobj-user
2.  vim-textobj-line    # 行文本对象(l=line) dal yal cil vil
3.  vim-textobj-entire  # 文件文本对象(e=entire file) dae yae cie
4.  vim-textobj-indent  # 缩进文本对象(i=indent) dai yai cii - 相同缩进属于同一块
```

> [chakan](#toc_18)

### 复制选择

```vim
1.  yyp                # 复制并粘贴到下一行
2.  yw yt*             # 复制单词或者复制到行内指定的标签前
3.  y$ Y               # 复制到行尾
4.  <leader> y         # 选择后复制到系统剪贴板
5.  <leader> sa ggVG   # 全选
6.  < = <gv / > = >gv  # 选中行缩进后再选中
7.  <leader> v         # 选择块
8.  v / V / Ctrl + v   # 进入选择模式/ 选择行 / 选择块
9.  gv `[v`]           # 选中并高亮最后一次插入的内容
```

### 搜索功能

```vim
1.  /                   # 进入搜索模式
2.  n / N               # 向下/向上搜索
3.  * / #               # 向下/向上搜索当前光标下的单词
4.  <leader> /          # 去掉搜索高亮
```

### 替换功能

## 三、插件

### [快速导航] nerdtree

```vim
<leader>     + n      # 打开目录树导航
## 文件操作
o / go                # 在当前窗口打开文件/预览窗口
s / gs                # 水平分屏打开文件  /水平预览窗口,光标在NerdTree中
v / gv                # 垂直分屏打开文件  /垂直预览窗口,光标在NerdTree中
t / T                 # 新建标签打开文件  /后台标签打开文件
## 目录操作
o / O                 # 展开关闭目录结构  /递归展开当前目录结构，包括子目录
x / X                 # 关闭当前目录结构  /递归关闭当前目录结构，包括子目录

#  移动操作
p / P                 # 跳到上级父目录   /直接跳到跟目录
J / K                 # 同级结构中最后一个/第一个
Ctrl         + j/k    # 同级结构中上下移动
m                     # 打开操作菜单，对文件或目录可增删改操作

# 其他操作
?                     # 打开或关闭面板

# 插件
vim-nerdtree-tabs     # 在新标签打开共享nerdtree，不需要每次重新打开nerdtree
```

### [快速注释] nerdcommenter

```vim
<leader>     + cc     # 块注释代码
<leader>     + cu     # 取消注释
<leader>     + cy     # 先复制，再注释，可使用p粘贴
<leader>     + c<空格> # 添加/取消注释，智能判断
```
> [vim插件: nerdcommenter[快速注释]](http://wklken.me/posts/2015/06/07/vim-plugin-nerdcommenter.html)

### [代码折叠] folding
sudo yum install python-devel.x86_64
sudo yum groupinstall 'Development Tools'
sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum install the_silver_searcher
sudo yum install cmake

```vim
<leader>     + zz     # 全文折叠
za                    # 光标所在区域折叠
```
### [文件搜索] ctrlp

```vim
<leader> + p     # 搜索框显示当前目录及其子目录下的所有文件列表(Files)
<leader> + f     # 搜索框显示最近打开的文件列表(MRU)
Ctrl     + f     # 在不同功能中切换 Files / MRU / Buffers / Funky
Ctrl     + d     # 展开菜单

## 搜索框出现后，输入关键字
Ctrl     + j/k   # 上下文件选择
Ctrl     + x     # 水平分屏 在当前窗口打开选择的文件
Ctrl     + v     # 垂直分屏 在当前窗口打开选择的文件
Ctrl     + t     # 新tab中打开文件
```
> [vim插件: ctrlp[文件搜索]](http://wklken.me/posts/2015/06/07/vim-plugin-ctrlp.html)

### [全局搜索] ctrlsf

```vim
\                # 光标移动到关键词下，按此键进入ctrlsf全局搜索模式
Ctrl     + j     # 移动光标到下一个匹配
Ctrl     + k     # 移动光标到上一个匹配

# 基本操作
t/T              # 在新tab中打开选中的文件，T焦点留在ctrlsf窗口、后台打开新标签。
p/P              # 在预览窗口中打开选中的文件，P切换焦点到预览窗口
O                # 打开文件并关闭ctrlsf窗口
M                # 在水平和垂直之间切换ctrlsf窗口
q                # 退出ctrlsf窗口

# 依赖ag
brew install node
npm install jshint -g
npm install jslint -g
npm install -g eslint eslint-plugin-standard eslint-plugin-promise eslint-config-standard eslint-plugin-import eslint-plugin-node eslint-plugin-html babel-eslint
```

### [语法检查] syntastic

```vim
<leader>  + s      # 打开或关闭语法错误检查预览窗
Ctrl      + j      # 移动到预览窗 
j or k CR          # 通过移动键选择错误提示然后回车，可定位到文件中的相应行
```
> [vim插件: syntastic[语法检查]](http://wklken.me/posts/2015/06/07/vim-plugin-syntastic.html)

### [快速跳转] easymotion

```vim
<leader><leader> + w/b    # 前后跳转
<leader><leader> + s      # 搜索跳转
<leader><leader> + j/k    # 上下行级跳转，比w/b力度粗
<leader><leader> + h/l    # 行内跳转
<leader><leader> + .      # 重复上一次操作
```
> [vim插件: easymotion[快速跳转]](http://wklken.me/posts/2015/06/07/vim-plugin-easymotion.html#5)

### [多光标操作] multiple-cursors

```vim
Ctrl     + m     # 选择光标下的选定词
Ctrl     + p     # 放弃一个，回到上一个
Ctrl     + x     # 跳过当前选中，选中下一个
esc              # 退出操作

```
# 选中以后可以增删替换 a/c/x等
```
> [vim插件: multiple-cursors[多光标操作]](http://wklken.me/posts/2015/06/07/vim-plugin-multiplecursors.html)

---------------------------------
### [快速标记跳转] vim-signature

```vim
m [a-zA-z]       # 添加标记
' [a-zA-z]       # 跳转到某标记
m ,              # 跳转到下个可用标记
m .              # 如果当前行没有标记，添加标记。有标记删除标记
m -              # 删除当前行的所有标记
m [space]        # 删除当前文件中所有标记

```
> [vim-signature[快速标记跳转]](http://www.wklken.me/posts/2015/06/07/vim-plugin-signature.html)

### [符号自动补全] delimitmate + closetag

```vim
### 被动触发 < " [ { ' 等符号
shift    +tab   # 跳转到补全符号的后面同时保留插入模式

### 成对标签补全 closetag
后一标签需要在不同行并需要输入光标位和上一行对齐以后才能补全
```
> [vim插件: delimitmate[符号自动补全]](http://www.wklken.me/posts/2015/06/07/vim-plugin-delimitmate.html)

### [快速对齐] easy-align

```vim
# 默认左对齐
<leader>a=              # 对齐等号表达式
<leader>a:              # 对比冒号表达式 json map等
<leader>a<space>        # 首个空格对齐
<leader>a2<space>       # 第二个空格对齐
<leader>a-<space>       # 倒数第一个空格对齐
<leader>a-2<space>      # 倒数第二个空格对齐
<leader>a*<space>       # 所有空格依次对齐

#  步骤，以等号对齐为例
1.  shift-v 进入行选择模式
2.  选择多行 j/k
3.  <leader> a
4.  =
```
> [vim插件: easy-align[快速对齐]](http://www.wklken.me/posts/2015/06/07/vim-plugin-easyalign.html)

### [文本对齐] tabular

```vim
# 命令
:Tab /=                 # 等号对齐
:Tab/:                  # 冒号对齐
:Tab /:\zs              # 冒号对齐，不包括冒号
:Tab/|                  # 表格样式对齐

# 映射
let mapleader=','
if exists(":Tabularize")
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:\zs<CR>
    vmap <Leader>a: :Tabularize /:\zs<CR>
endif

```
>[Aligning text with Tabular.vim](http://vimcasts.org/episodes/aligning-text-with-tabular-vim/)

### [行尾空格处理] trailing-whitespace

```vim
<leader>     + space      # 一键去除所有行尾空格
```
> [vim插件: trailing-whitespace[行尾空格处理]](http://www.wklken.me/posts/2015/06/07/vim-plugin-trailing-whitespace.html)

### [快速执行] quickrun

```vim
<leader>     + r <CR>     # 等同F10 执行代码
```

### [参数格式] vim-argwrap

```vim
<leader> a      #  格式化参数格式
```
![](media/14915816176056/14926166883484.jpg)
> [vim-argwrap](https://github.com/FooSoft/vim-argwrap)

## 四、语言

### 智能感知
#### [代码完成] YouCompleteMe
```vim
###  use
<leader>  gd/jd  # 跳到定义处
Ctrl   + Space   # 主动触发补全，默认输入两个字符以上自动补全
Ctrl   + j/k n/p # 补全窗口上下选择

###  install
pyenv shell system
python install.py --clang-completer
```

#### [代码片段] Ultisnips + vim-snippets

```vim
Ctrl   + j/k n/p # 补全窗口上下选择
Tab              # 完成代码片段插入

### 命令模式查看UltiSnips加载的片段
:execute g:_uspy 'print(UltiSnips_Manager.get_buffer_filetypes())'

### ultisnips(代码片段补全工具) 

### vim-snippets(常用代码片段)
```


### 前端工具
#### [Emmet]

```vim
# vim-emmet
html:5 / ! +   ctrl-e ,  # 补全html结构

# 命令模式 查看绑定的前缀键
:echo user_emmet_leader_key
```

#### [JavaScript]

```vim
##  插件
othree/yajs.vim | pangloss/vim-javascript
othree/javascript-libraries-syntax.vim
marijnh/tern_for_vim
Quramy/vim-js-pretty-template

## tern命令
<leader>td          # 跳转到定义
<leader>tr          # 查找引用
<leader>tR          # 重命名

## JsPreTmpl命令 模板
:JsPreTmpl html

## jshint nodejs X not defined
1. 定义global 缺少的都写在里面
/*global require, module,  __dirname, console, process */

2. 定义node为true
/*jslint node: true, mocha:true */
"use strict";

```
>[Setting up Vim for JavaScript development](https://davidosomething.com/blog/vim-for-javascript/)
>[How to use jslint in node.js projects properly](https://coderwall.com/p/-h1h1w/how-to-use-jslint-in-node-js-projects-properly)

#### [NodeJS]

```vim
## 插件
moll/vim-node

## 操作
gf                  # 跳转到文件定义
[I                  # 查找引用
gv        选中并高亮最后一次插入的内容
:Nedit ./mname      # 编辑当前模块或者mname指示的模块
Ctrl+w Ctrl+f       # 垂直窗口打开光标下的文件 Ctrl+w+f也是

# 配置
autocmd User Node
        \ if &filetype == "javascript" |
        \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
        \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
        \ endif


```

#### [TypeScript]

```vim
##  插件
leafgarland/typescript-vim
Quramy/tsuquyomi
Shougo/vimproc.vim

## Tsquyomi命令
:TsuImport          # 自动导入文件<自动import>
:TsuDefinition      # 跳转到定义
:TsuReferences      # 显示引用

## Angular / ng
5. YCM 设置回车选中不再弹补全框

细节:
1. 新增快捷键 gv 选中并高亮最后一次插入的内容
```

### Contributors

thx a lot. 可以给我提pull request:)

查看详情 [git-contributors](https://github.com/wklken/k-vim/graphs/contributors)

### Inspire

1. vimrc文件布局`vimrc+vimrc.bundles`配置方式参考 [maximum-awesome](https://github.com/square/maximum-awesome)

2. install.sh 参考`spf13-vim` 的`bootstrap.sh` [spf13-vim](https://github.com/spf13/spf13-vim)

2. 插件管理使用[Vim-plug](https://github.com/junegunn/vim-plug)

3. 自动补全 [YCM](https://github.com/Valloric/YouCompleteMe)

4. 插件挑选 [VimAwesome](http://vimawesome.com/)

### Resources

> [Vim Configuration for TypeScript and Angular2 Development](http://www.blog.bdauria.com/?p=692)

#### [AngularJS]

```vim
##  插件 angularjs
burnettk/vim-angular
gf                  # 跳转到定义<服务、控制器等>
<leader>rs          # run spec
<leader>rb          # run spec block
```

## 五、其他
### 性能测试

```shell
vim --startuptime vim.log
vim -u NONE -N --startuptime /dev/stdout -c quit
```



