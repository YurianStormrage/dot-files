" 指定viminfo文件
set viminfofile=$HOME/.config/vim/.viminfo

""" >>>>>> editor >>>>>>

" 行号
set number
" 相对行号
set relativenumber

" 光标行高亮
set cursorline

" 行宽
set textwidth=80

" 自动换行
set wrap
" 不在单词内部换行
set linebreak

" 滚动时，光标与顶部/底部的距离
"set scrolloff=5

" 是否显示状态栏
" 0 不显示
" 1 多窗口时显示
" 2 显示
set laststatus=2
" 状态栏显示光标位置
set ruler

" 是否与 Vi 兼容
set nocompatible

" 语法高亮
syntax on

" 显示模式
set showmode

" 显示命令
set showcmd

" 支持鼠标
set mouse=a

" encoding
set encoding=utf-8

" 颜色 256色
set t_Co=256

""" <<<<<< editor <<<<<<

""" >>>>>> indent >>>>>>

" 基于文件类型缩进
filetype indent on

" 自动缩进
set autoindent

" <tab>宽度
set tabstop=4
" 缩进命令的宽度
set shiftwidth=4
" 输入的tab转为spaces
set expandtab
" 输入tab时用<tab>和<space>填充至该宽度（优先使用<tab>）
"set softtabstop=4

""" <<<<<< indent <<<<<<

""" >>>>>> search >>>>>>

" 显示匹配的空格
set showmatch

" 搜索时自动跳转到第一个匹配的结果
set incsearch

" 搜索忽略大小写
set ignorecase
" 打开`ignorecase`时：搜索的单词只有 1 个大写字母时，不忽略大小写
set smartcase

""" <<<<<< search <<<<<<

""" >>>>>> editing >>>>>>

" 拼写检查
"set spell spelllang=en_us

" 备份文件
"set nobackup
" 交换文件
"set noswapfile

" 保留撤销历史
set undofile

" 设置备份文件、交换文件、操作历史文件的保存位置
" 结尾的`//`表示生成的文件名带有绝对路径，路径中用`%`替换目录分隔符，这样可以防止文件重名
set backupdir=$HOME/.local/state/vim/.backup//
set directory=$HOME/.local/state/vim/.swp//
set undodir=$HOME/.local/state/vim/.undo//

" 自动切换工作目录
set autochdir

" 关闭错误提示音
set noerrorbells

" 视觉错误提示
set visualbell

" 历史操作的记忆数量
set history=1000

" 监视文件是否被外部修改
set autoread

" list模式下，特殊显示的字符
set listchars=eol:$,tab:<->,trail:■
" List Mode
set list

" 命令模式补全菜单
set wildmenu
" 命令模式补全方式，用逗号间隔表示启用顺序，用冒号间隔表示同时启用
" list      列出所有补全
" full      补全至下一个完整字符串
" longest   补全至下一个最长公共字符串
set wildmode=list:full

""" <<<<<< editing <<<<<<
