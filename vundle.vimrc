set nocompatible  " 去除VI一致性,必须要添加
filetype off " 必须要添加

"设置包括vundle和初始化相关的runtime path
"set rtp+=$VIM/vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
let plugin_path="/mac/install/vimrc/bundle" "插件安装路径
"call vundle#begin("/mac/vim")
call vundle#begin(plugin_path)
Plugin 'VundleVim/Vundle.vim'
"Plugin 'majutsushi/tagbar' "函数列表等信息
Plugin 'scrooloose/nerdtree'	"目录树
Plugin 'taglist.vim' "显示文档结构
Plugin 'vim-airline/vim-airline' "状态栏
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Valloric/YouCompleteMe' "自动补全
Plugin 'davidhalter/jedi-vim' "python自动补全
Plugin 'scrooloose/nerdcommenter' "注释
Plugin 'jiangmiao/auto-pairs' "自动匹配括号等
Plugin 'Yggdroot/indentLine' "显示缩进
Plugin 'tell-k/vim-autopep8' "自动格式化
Plugin 'ctrlp.vim' "增加搜索
call vundle#end()
"filetype plugin indent on    " 必须加载vim自带和插件相应的语法和文件类型相关脚本

"nerdtree设置 {{{
autocmd vimenter * NERDTree "启动vim时自动打开插件
"当只有目录窗口存在时，关闭vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"}}}

"taglist 设置 {{{
let Tlist_Use_Right_Window=1
let Tlist_Auto_Open=0
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close=1 "同时显示多个文件的taglist
"}}}

"jedi-vim配
let g:jedi#auto_initialization=1
let g:jedi#use_splits_not_buffers="right"
let g:jedi#use_tabs_not_buffers=1
let g:jedi#popup_select_first=0
let g:jedi#show_call_signatures=2

"nerdcommenter
let g:NERDAltDelims_python=1
let g:NERDSpaceDelims=1

"indent
let g:indentLine_enabled=1
let g:indentLine_setColors=0
let g:indentLine_color_term = 239

"autopep8
"let g:autopep8_on_save=1
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

"youcompleteme
nnoremap <leader>g :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>d :YcmCompleter GoToDefinition<CR>
nnoremap <leader>dg :YcmCompleter GoToDefinitionElseDeclaration<CR>

"airline
let g:airline#extensions#branch#enabled=1
