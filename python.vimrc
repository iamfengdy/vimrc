"python设置{{{ 
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab "Python文件的一般设置
"autocmd FIleType python map <F5> :!python %<CR>
"vmap <C-c> "+y "选中状态下 ctrl＋c 复制
"autocmd FileType python set omnifunc=python3complete#Complet
"}}}

"""""""""""""""""""""""""""""
"新文件标题设置"
"""""""""""""""""""""""""""""
autocmd BufNewFile *.py, exec ":call SetPythonTitle()"
"定义函数SetTitle，自动插入文件头
func! SetPythonTitle()
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call setline(2, "\# -*-coding:utf-8-*-")
        call setline(3, "\# @Author:fengdy")
        call setline(4, "\# @Email:iamfengdy@126.com")
        call setline(5, "\# @DateTime:".strftime("%Y/%m/%d %H:%M"))
        call setline(6, "\ ")
        call setline(7, "\''' '''")
        call setline(8, "\__version__ = '1.0'")
        call setline(9, "\__history__ = ''' '''")
        call setline(10, "\__all__ = []")
    endif
	"新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc
"映射F5为编译运行
map <F5> :call CompileAndRunPython()<CR>
func! CompileAndRunPython()
    setlocal buftype=
    "et time_cmd="!"
    silent !clear
    let time_cmd='!date "+\%F \%T" && '
	exec "w"
	if &filetype == 'python'
		exec time_cmd."python %"
    elseif &filetype == 'sh'
		exec time_cmd"bash %"
	endif
    setlocal buftype=
endfunc
