"设置{{{ 
"}}}
"编码设置{{{
language messages zh_CN.utf-8 "vim提示信息乱码的解决
set encoding=utf-8 "内部编码，包括缓冲区、菜单、消息等，主要用于显示
set fileencoding=utf-8 "文件当前编码，保存时也会以此为准
set fileencodings=utf-8,Unicode,gbk2312,gbk,gb18030,cp936,latin1 "打开文件时解码的猜测列表
set langmenu=zh_CN
let $LANG = 'en_US.UTF-8'
"}}}

"键盘映射相关{{{ 
map <F5> :!python3 % "F12 运行python
"}}}

"基本设置{{{ 
set nocompatible " 关闭vi 兼通模式
set mouse=a  "启用鼠
autocmd BufWritePost $MYVIMRC source $MYVIMRC "让配置立即生效
"set pythonthreedll=python36.dll "设置python共享库动态加载路径，windows是dll，unix是so文件
set pythonthreedll=/mac/install/python3.6.5/lib/libpython3.6m.dylib
"}}}


"显示设置{{{ 
set nu "显示行号
syntax enable
syntax on "自动语法高亮
set showcmd "输入的命令显示出来
set ruler " 打开状态标尺
set laststatus=1 "启动显示状态行1，总是显示2
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\  " 设置在状态行显示的信息
set cursorline "突出显示当前行
"colorscheme tomorrow "配色方案
set guioptions-=e "使用内置 tab 样式而不是 gui
"}}}


"文件设置{{{ 
set autoread "文件改动时自动载入
set expandtab "空格代替tab
set tabstop=4 " 设定tab长度为4个空格
set shiftwidth=4 "设定 <<和>> 命令移动时宽度为4
set softtabstop=4 "设定按退格键可以一次删掉4个空格
set backspace=2 "使回格键（backspace）正常处理indent, eol, start等
set nobackup "不备份
set autochdir "自动切换目录为当前文件所在目录
set backupcopy=yes "设定备份时的行为为覆盖

set autoindent "自动缩进
set smartindent "开启新行时使用智能自动缩进

set foldenable "开始折叠
set foldmethod=syntax "设置折叠 syntax语法折叠，manual手动折叠，indent基于缩进代码折叠
set foldcolumn=0 "设置折叠区域宽度
"set lcoalfoldlever = "折叠层数
"set foldclose=all "设置为自动关闭折叠

"set ignorecase smartcase "搜索时忽略大小写，但在有一个或以上大写字母时保持对大小写
set nowrapscan "禁止在搜索到文件两端时重新搜索
set incsearch "搜索内容时就显示搜索结果
set hlsearch "高亮显示搜索文本
set showmatch "插入括号时，短暂的跳转到匹配的对应括号
"set matchtime=2 "短暂挑战到匹配括号的时间

set completeopt=preview,menu,longest "自动补全 
set wildmenu "自动补全命令时候使用菜单式匹配列表 
"}}}


"插件设置{{{ 
filetype on "侦测文件类型
filetype plugin on "为特定文件类型载入相关缩进文件
filetype plugin indent on "允许插件
"}}

"ctags设置{{{
"let Tlist_Ctags_Cmd='/usr/local/bin/ctags' "设备ctags命令路径
set tags=tags "
set tags+=./tags "表示在当前目录tags中搜索tags文件
set tags+=/mac/install/python3.6.5/tags "表示还要搜索/usr/tags目录下的tags文件

"map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
"imap <F5> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
"ctags -R --languages=python --python-kinds=cfmvi --fields=aimS
map <F5> :!ctags -R --languages=python --python-kinds=cfmvi --fields=aimS .<CR><CR> :TlistUpdate<CR>
"}}}
