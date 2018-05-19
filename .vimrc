"vundle 环境设置
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/asyncomplete.vim'
"自动补全
Plugin 'jistr/vim-nerdtree-tabs'
"共享nerdtree
Plugin 'kien/ctrlp.vim'
"文件跳转
Plugin 'rking/ag.vim'
"搜索文件
":Ag 'pattern' 'directory'
Plugin 'VundleVim/Vundle.vim'
"插件管理
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
"颜色主题
Plugin 'Lokaltog/vim-powerline'
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
"快速注释
"Plugin 'Valloric/YouCompleteMe'
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
"快速跳转 快速搜索
call vundle#end()
filetype plugin indent on

let mapleader=";"

"设置语法高亮
syntax enable
set background=dark
colorscheme molokai

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
"默认大小写不敏感查找
set ignorecase
"如果有一个大写字母，则自动切换到大小写敏感
set smartcase

nmap <silent> <Leader>sw :FSHere<cr>
"接口文件和文件切换

" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"插入状态的光标改为竖线

nmap <F8> :TagbarToggle<CR>
"F8显示tagbar

let g:NERDSpaceDelims=1
"自动在注释后添加空格

autocmd vimenter * NERDTree
nmap <F9> :NERDTree<CR>
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
set guifont=Menlo\ Regular:h15
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
let g:Powerline_colorscheme='solarized256'

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

inoremap { {<CR>}<ESC>kA<CR>
"输入{自动补全，并格式化

inoremap <s-cr> <ESC>la
"shift+enter 跳出括号

inoremap ( ()<ESC>ha
inoremap " ""<ESC>ha
