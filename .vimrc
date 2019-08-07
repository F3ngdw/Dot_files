set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'https://github.com/scrooloose/nerdtree'
" tree
Plugin 'kien/rainbow_parentheses.vim'
" 不同颜色括号
Plugin 'https://github.com/bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" 状态栏
Plugin 'w0rp/ale'
" 自动代码检测
Plugin 'scrooloose/syntastic'
" 语法检测
Plugin 'Yggdroot/indentLine'
" 缩进线
Plugin 'mileszs/ack.vim'
" ack
Plugin 'jiangmiao/auto-pairs'
" auto-pairs
Plugin 'ctrlpvim/ctrlp.vim'
" 文件搜索
Plugin 'airblade/vim-gitgutter'
" git显示被编辑的行
Plugin 'davidhalter/jedi-vim'
" jedi补全
Plugin 'SuperTab'
" tab插入
Plugin 'scrooloose/nerdcommenter'
" 自动注释
Plugin 'fatih/vim-go'
" golang
Plugin 'majutsushi/tagbar'
" tagbar
Plugin 'iamcco/mathjax-support-for-mkdp'
Plugin 'iamcco/markdown-preview.vim'
" markdown
Plugin 'easymotion/vim-easymotion'
" easymotion跳转
Plugin 'tpope/vim-surround'
" 包围


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
colorscheme onedark
let g:airline_theme='onedark'
""hi Search term=reverse ctermbg=180 guifg=yellow guibg=yellow

set background=dark
set mouse=a
set t_Co=256
set ic
set hlsearch
set ignorecase
set smartcase
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,GB2312,big5
set cursorline
set autoindent
set smartindent
set cindent
set scrolloff=1
set showmatch
set nu
set expandtab
set wildmenu   " wild char completion menu


let mapleader = ','
" 编辑生效vimrc
nnoremap <leader>ev :vsplit ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>
" 空格取消高亮
nnoremap <space> :nohl<cr>
" 滚屏使光标所在行处于屏幕中间
nnoremap j jzz
nnoremap k kzz
" 正常模式下 <c-w>+j,k,h,l 调整分割窗口大小
nnoremap <c-w>j :res +5<cr>
nnoremap <c-w>k :res -5<cr>
nnoremap <c-w>h :vertical res -5<cr>
nnoremap <c-w>l :vertical res +5<cr>
"窗口跳转
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" select the pasted block
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
nnoremap zpr :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>:set foldmethod=manual<CR><CR>


"python定制
let python_highlight_all=1
au Filetype python set tabstop=4
au Filetype python set softtabstop=4
au Filetype python set shiftwidth=4
au Filetype python set textwidth=119 " 自动换行
au Filetype python set expandtab
au Filetype python set autoindent
au Filetype python set fileformat=unix
autocmd Filetype python set foldmethod=indent
autocmd Filetype python set foldlevel=99

"F5自动执行代码
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'cpp'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'java'
                exec "!javac %"
                exec "!time java %<"
        elseif &filetype == 'sh'
                :!time bash %
        elseif &filetype == 'python'
                exec "!clear"
                exec "!time python3 %"
        elseif &filetype == 'html'
                exec "!firefox % &"
        elseif &filetype == 'go'
                " exec "!go build %<"
                exec "!time go run %"
        elseif &filetype == 'mkd'
                exec "!~/.vim/markdown.pl % > %.html &"
                exec "!firefox %.html &"
        endif
endfunc


"F3显示文件树
nnoremap <F1> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc', '\~$', '\.swp']
let NERDTreeShowBookmarks=2
let NERDTreeShowLineNumbers=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"不同颜色括号
"let g:rbpt_colorpairs = [
"                        \ ['brown',       'RoyalBlue3'],
"                        \ ['Darkblue',    'SeaGreen3'],
"                        \ ['darkgray',    'DarkOrchid3'],
"                        \ ['darkgreen',   'firebrick3'],
"                        \ ['darkcyan',    'RoyalBlue3'],
"                        \ ['darkred',     'SeaGreen3'],
"                        \ ['darkmagenta', 'DarkOrchid3'],
"                        \ ['brown',       'firebrick3'],
"                        \ ['gray',        'RoyalBlue3'],
"                        \ ['darkmagenta', 'DarkOrchid3'],
"                        \ ['Darkblue',    'firebrick3'],
"                        \ ['darkgreen',   'RoyalBlue3'],
"                        \ ['darkcyan',    'SeaGreen3'],
"                        \ ['darkred',     'DarkOrchid3'],
"                        \ ['red',         'firebrick3'],
"                        \ ]
"let g:rbpt_max = 16
"let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


" 自动代码检测
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ack.vim
let g:ackprg = 'ag --vimgrep --smart-case --ignore-dir=tags' 
let g:ackhighlight = 1
nnoremap <leader>v :Ack! -w <c-r><c-w><cr>

" auto-pairs
let g:AutoPairs = {'(':')', '[':']', '{':'}', "'":"'", '"':'"'}
" let g:AutoPairs['<']='>'
let b:AutoPairs = g:AutoPairs

" air-line
let g:airline_thee = "luna"
let g:airline_powerline_fonts = 1
let g:arline_extensions = ['branch', 'tabline']
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#vcs_priority = ["git", "mercurial"]

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 0 " # of splits (default)
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number
let g:airline#extensions#tabline#tabnr_formatter = 'tabnr'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#buffers_label = 'b'
let g:airline#extensions#tabline#tabs_label = 't'
let g:airline#extensions#tabline#overflow_marker = '…'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
nnoremap <C-M> :bn<CR>
nnoremap <C-N> :bp<CR>
""nnoremap <C-D> :bdelete<CR>
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

"taglist
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
let Tlist_Use_SingleClick=1
let Tlist_Use_Right_Window=1
nnoremap <F8> :TlistToggle<CR>

" ctrlp
""let g:ctrlp_map = '<leader>p'
""let g:ctrlp_cmd = 'CtrlP'
""nmap <leader>f :CtrlPMRUFIles<CR>
""nmap <leader>b :CtrlPBuffer<CR>
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_max_height = 15
let g:ctrlp_match_window_reversed = 0 
let g:ctrlp_mruf_max = 500 
let g:ctrlp_follow_symlinks = 1 
let g:ctrlp_by_filename = 1
let g:ctrlp_regexp = 0
let g:ctrlp_line_prefix = '⇒  '
let g:ctrlp_open_new_file = 'v'

" supertab
let g:SuperTabRetainCompletionType = 2
let g:SuperTabDefaultCompletionType = "<c-n>"

let g:indentLine_char = '┆'
let g:indentLine_color_term = 239
let g:indentLine_enabled = 1
let g:indentLine_color_gui = '#A4E57E'

" tag文件
"set tags=/Users/fengdingwei/PycharmProjects/agent-robot/tags
"set tags+=/Users/fengdingwei/PycharmProjects/agent-robot/tags
set tag=tags;
"set autochdir
"
" nerdcomment
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" tagbar
let g:tagbar_width=35
let g:tagbar_autofocus=0
let g:tagbar_autoclose=0
let g:tagbar_sort=0
let g:tagbar_ctags_bin='ctags'
map <F8> :TagbarToggle<CR>

" GO
imap jj <C-x><C-o>
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_version_warning = 1
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_denerate_tags = 1
let g:godef_split = 1
let g:go_disable_autoinstall = 0

" MARKDOWN
nmap <silent> <F9> <Plug>MarkdownPreview        " for normal mode
imap <silent> <F9> <Plug>MarkdownPreview        " for insert mode
nmap <silent> <F10> <Plug>StopMarkdownPreview    " for normal mode
imap <silent> <F10> <Plug>StopMarkdownPreview    " for insert mode

" YCM
set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
" 跳转到定义处
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F6> :YcmForceCompileAndDiagnostics<CR>    "force recomile with syntastic
" nnoremap <leader>lo :lopen<CR>    "open locationlist
" nnoremap <leader>lc :lclose<CR>   "close locationlist
inoremap <leader><leader> <C-x><C-o>
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
" 不显示开启vim时检查ycm_extra_conf文件的信息
let g:ycm_confirm_extra_conf=0
" 开启基于tag的补全，可以在这之后添加需要的标签路径
let g:ycm_collect_identifiers_from_tags_files=1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" 输入第2个字符开始补全
let g:ycm_min_num_of_chars_for_completion=2
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 开启语义补全
let g:ycm_seed_identifiers_with_syntax=1
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1

" easymotion
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
" 重复上一次操作, 类似repeat插件, 很强大
map <Leader><leader>. <Plug>(easymotion-repeat)
