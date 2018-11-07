"vundle 环境设置
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'Shougo/vimproc.vim'
Plugin 'shougo/vimshell.vim'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/asyncomplete.vim'
"自动补全
Plugin 'bling/vim-airline'
"airline
Plugin 'tpope/vim-repeat'
".重复上一个动作
Plugin 'scrooloose/syntastic'
"语法检查 <leader>sn下一个 <leader>sp上一个
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jistr/vim-nerdtree-tabs'
"共享nerdtree
Plugin 'kien/ctrlp.vim'
"文件跳转 <c-p>
Plugin 'rking/ag.vim'
"搜索文件
":Ag 'pattern' 'directory'
Plugin 'VundleVim/Vundle.vim'
"插件管理
"常用命令
" :PluginList       - 查看已经安装的插件
" :PluginInstall    - 安装插件
" :PluginUpdate     - 更新插件
" :PluginSearch     - 搜索插件，例如 :PluginSearch xml就能搜到xml相关的插件
" :PluginClean      - 删除插件，把安装插件对应行删除，然后执行这个命令即可
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-surround'
"快速给词加环绕符号

" # 替换: cs"'
" "Hello world!" -> 'Hello world!'
" # 替换-标签(t=tag): cst"
" <a>abc</a>  -> "abc"
" cst<html>
" <a>abc</a>  -> <html>abc</html>
" # 删除: ds"
" "Hello world!" -> Hello world!
" # 添加(ys=you surround): ysiw"
" Hello -> "Hello"
" # 添加: csw"
" Hello -> "Hello"
" # 添加-整行: yss"
" Hello world -> "Hello world"
" # ySS"
" Hello world ->
" "
    " hello world
" "
" # 添加-两个词: veeS"
" hello world -> "hello world"
" # 添加-当前到行尾: ys$"
" # 左符号/右符号 => 带不带空格

Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
"颜色主题
"Plugin 'Lokaltog/vim-powerline'
"美化状态栏
Plugin 'nathanaelkane/vim-indent-guides'
"缩进
Plugin 'derekwyatt/vim-fswitch'
"在文件和接口文件之间跳转 <leader>sw切换
Plugin 'majutsushi/tagbar'
"browse the tags of the current file and get an overview of its structure
"F8
Plugin 'terryma/vim-multiple-cursors'
"多光标 <c-n> <c-p> <c-n>
Plugin 'scrooloose/nerdcommenter'
"快速注释 <leader>cc <leader>cu
"Plugin 'Valloric/YouCompleteMe'
Plugin 'taglist.vim'

Plugin 'scrooloose/nerdtree'
"文件树
Plugin 'Xuyuanp/nerdtree-git-plugin'
"git 共享
Plugin 'fholgado/minibufexpl.vim'
"多buffer管理 通过：bn bp 切换
Plugin 'gcmt/wildfire.vim'
"自动选择一段 visual模式enter
Plugin 'sjl/gundo.vim'
"undotree
Plugin 'Lokaltog/vim-easymotion'
Plugin 'morhetz/gruvbox'
"快速跳转 快速搜索
"<leader><leader>w
call vundle#end()
filetype plugin indent on

let mapleader=";"

"设置语法高亮
syntax enable
set background=dark
colorscheme  gruvbox

set nu!
"设置行号显示
set autoindent
"自动对齐
set tabstop=4
"tab键为四个空格
set ai!
"自动缩进
set showmatch
"匹配模式，输入左括号匹配右括号
filetype on
set cindent
"C语言自动缩进
set smartindent
"智能对齐
set vb t_vb=
"去除自动警报
set ruler
"右下角显示光标位置的状态行
set backspace=2
"退格键可用

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|pyc)$'
"文件跳转

"内容搜索插件ag配置
"the_silver_searcher配置
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:ag_prg="/usr/local/bin/ag --vimgrep"

"配置变更立即生效
" autocmd BufWritePost $MYVIMRC source $MYVIMRC

"开启实时搜索
set incsearch
"自身命令行自动补全
set wildmenu
"默认大/小写不敏感查找
set ignorecase
"如果有一个大写字母，则自动切换到大小写敏感
set smartcase

nmap <silent> <Leader>sw :FSHere<cr>
"接口文件和文件切换

"插入状态的光标改为竖线

nmap <F8> :TagbarToggle<CR>
"F8显示tagbar

let g:NERDSpaceDelims=1
"自动在注释后添加空格

autocmd vimenter * NERDTree
nmap <F9> :NERDTree<CR>
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
" let g:airline_symbols.branch = '⭠'
" let g:airline_symbols.readonly = '⭤'
set guifont=Inconsolata\ for\ Powerline:h17
"<F9>显示文件树
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"设置nerdtree自动启动

" 打开NERDTree快捷键
let NERDTreeShowLineNumbers=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"剩一个窗口时自动关闭
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=31
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
"显示git

nnoremap <leader>h :GundoToggle<CR>
"配置undotree快捷键
map <F11> :InstantMarkdownPreview<CR>
"打开预览快捷键为F11

set lines=80 columns=150
" set guifont=Monaco:h16
"设置默认窗口大小以及字体字号，for macvim

set guioptions=
"关闭两侧滚动条

if executable('cquery')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'cquery',
      \ 'cmd': {server_info->['cquery']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), '.cquery'))},
      \ 'initialization_options': { 'cacheDirectory': '/tmp/cquery/cache' },
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
endif
"cquery 代码补全

"代码折叠
" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

"高亮当前行
set cursorline
highlight CursorLine   cterm=NONE ctermbg=black guibg=black 

set hlsearch
"高亮显示搜索结果

"可视化缩进
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
set ts=4 sw=4 et
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
nmap <silent> <Leader>i <Plug>IndentGuidesToggle

"总是显示状态栏
set laststatus=2
"状态栏主题风格
"let g:Powerline_colorscheme=''

" 禁止折行
set nowrap

" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
"tab completion
imap <c-space> <Plug>(asyncomplete_force_refresh)
"force refresh completion
" let g:asyncomplete_auto_popup = 0
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"use tab to show the autocomplete
let g:asyncomplete_remove_duplicates = 1
"remove duplicates
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
"auto close preview window when completion is done

inoremap { {}<ESC>i
"输入{自动补全，并格式化

inoremap <s-cr> <ESC>la
"shift+enter 跳出括号

inoremap ( ()<ESC>ha
inoremap " ""<ESC>ha
inoremap [ []<ESC>ha
inoremap ' ''<ESC>ha

function! RemovePairs()  
    let l:line = getline(".") 
    let l:previous_char = l:line[col(".")-1] 
    if index(["(", "[", "{"], l:previous_char) != -1 
        let l:original_pos = getpos(".") 
        execute "normal %" 
        let l:new_pos = getpos(".")
        if l:original_pos == l:new_pos      
            execute "normal! a\<BS>"  
            return  
        end   
        let l:line2 = getline(".")
        if len(l:line2) == col(".")   
            execute "normal! v%xa"           
        else 
            execute "normal! v%xi"
        end   
    else  
        execute "normal! a\<BS>"
    end
endfunction 
inoremap <BS> <ESC>:call RemovePairs()<CR>a
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_highlighting=1
let g:syntastic_python_checkers=['pyflakes'] " 使用pyflakes,速度比pylint快
let g:syntastic_javascript_checkers = ['jsl', 'jshint']
let g:syntastic_html_checkers=['tidy', 'jshint']
" 修改高亮的背景色, 适应主题
highlight SyntasticErrorSign guifg=white guibg=black

" to see error location list
let g:syntastic_always_populate_loc_list = 1 
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction
nnoremap <Leader>s :call ToggleErrors()<cr>
nnoremap <Leader>sn :lnext<cr>
nnoremap <Leader>sp :lprevious<cr>

let Tlist_Show_One_File=1    "只显示当前文件的tags
let Tlist_WinWidth=40        "设置taglist宽度
let Tlist_Exit_OnlyWindow=1  "tagList窗口是最后一个窗口，则退出Vim
let Tlist_Use_Right_Window=1 "在Vim窗口右侧显示taglist窗口

if has("autocmd")
    au BufReadPost *.scm set filetype=scheme
  endif
" Rename.vim  -  Rename a buffer within Vim and on the disk
"
" Copyright June 2007-2011 by Christian J. Robinson <heptite@gmail.com>
"
" Distributed under the terms of the Vim license.  See ":help license".
"
" Usage:
"
" :Rename[!] {newname}

command! -nargs=* -complete=file -bang Rename call Rename(<q-args>, '<bang>')

function! Rename(name, bang)
	let l:name    = a:name
	let l:oldfile = expand('%:p')

	if bufexists(fnamemodify(l:name, ':p'))
		if (a:bang ==# '!')
			silent exe bufnr(fnamemodify(l:name, ':p')) . 'bwipe!'
		else
			echohl ErrorMsg
			echomsg 'A buffer with that name already exists (use ! to override).'
			echohl None
			return 0
		endif
	endif

	let l:status = 1

	let v:errmsg = ''
	silent! exe 'saveas' . a:bang . ' ' . l:name

	if v:errmsg =~# '^$\|^E329'
		let l:lastbufnr = bufnr('$')

		if expand('%:p') !=# l:oldfile && filewritable(expand('%:p'))
			if fnamemodify(bufname(l:lastbufnr), ':p') ==# l:oldfile
				silent exe l:lastbufnr . 'bwipe!'
			else
				echohl ErrorMsg
				echomsg 'Could not wipe out the old buffer for some reason.'
				echohl None
				let l:status = 0
			endif

			if delete(l:oldfile) != 0
				echohl ErrorMsg
				echomsg 'Could not delete the old file: ' . l:oldfile
				echohl None
				let l:status = 0
			endif
		else
			echohl ErrorMsg
			echomsg 'Rename failed for some reason.'
			echohl None
			let l:status = 0
		endif
	else
		echoerr v:errmsg
		let l:status = 0
	endif

	return l:status
endfunction
"将tab映射为自动补全，若没有匹配，则为普通补全
function! CleverTab()
    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
        return "\<Tab>"
    else
        return "\<C-N>"
    endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>
"设置ruby缩进为2
autocmd FileType ruby setlocal et sta sw=2 sts=2

"设置vimshell
let g:vimshell_prompt_expr =
		\ 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '

"设置F7为打开vimshell
map <F7> :VimShellPop<CR>
