""==================================================
"" Runtime Path for Plug-Ins
""==================================================
set	rtp+=~/.vim/pack/plugins/start/fzf
set	rtp+=~/.vim/pack/plugins/start/tagbar
set	rtp+=~/.vim/pack/plugins/start/tabular
set	rtp+=~/.vim/pack/plugins/start/gruvbox
set	rtp+=~/.vim/pack/plugins/start/ctrlp.vim
set	rtp+=~/.vim/pack/plugins/start/nerdtree
set	rtp+=~/.vim/pack/plugins/start/syntastic
set	rtp+=~/.vim/pack/plugins/start/AutoComplPop
set	rtp+=~/.vim/pack/plugins/start/vim-wiki
set	rtp+=~/.vim/pack/plugins/start/vim-airline
set	rtp+=~/.vim/pack/plugins/start/vim-autoread
set	rtp+=~/.vim/pack/plugins/start/vim-floaterm
set	rtp+=~/.vim/pack/plugins/start/vim-surround
set	rtp+=~/.vim/pack/plugins/start/vim-indent-guides
set	rtp+=~/.vim/pack/plugins/start/tlib_vim
set	rtp+=~/.vim/pack/plugins/start/vim-addon-mw-utils
set	rtp+=~/.vim/pack/plugins/start/vim-snippets
set	rtp+=~/.vim/pack/plugins/start/vim-snipmate
set	rtp+=~/.vim/pack/plugins/start/vim-verilog

""==================================================
"" Bundle Configurations
""==================================================
" plugin:nerdtree&tagbar
let g:NERDTreeWinSize = 18
let g:Tlist_WinWidth  = 22

" plugin:ctrlp 
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" plugin:syntastic
imap <C-J> <Plug>snipMateNextOrTrigger
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 1
let g:syntastic_check_on_open            = 0
let g:syntastic_check_on_wq              = 1
let g:syntastic_error_symbol             = 'E'
let g:syntastic_warning_symbol           = 'W'
let g:syntastic_loc_list_height          = 4
let g:syntastic_verilog_checkers         = ['iverilog']
let g:syntastic_python_checkers          = ['python3']
let g:syntastic_cpp_compiler             = 'g++'
let g:syntastic_cpp_compiler_options     = '-std=c++14'

" plugin:tabular
let mapleader=','
if exists(":Tabularize")
	nmap <Leader>a= :Tabularize /=<CR>
	vmap <Leader>a= :Tabularize /=<CR>
	nmap <Leader>a: :Tabularize /:\zs<CR>
	vmap <Leader>a: :Tabularize /:\zs<CR>
endif

"==================================================
" Basic Setting
"==================================================
set	nocompatible
set	clipboard=unnamed
set	viewdir=~/.vim/view
set guioptions-=m
set guioptions-=T
set guioptions-=r
set	tags=~/projects/tags
augroup remember_folds
	autocmd!
	autocmd BufWinLeave *.* mkview
	autocmd BufWinEnter *.* silent! loadview
augroup END
autocmd	FileType * setlocal comments-=://
"==================================================
" Map Setting
"==================================================
nmap ,s			: w<CR> :source ~/.vimrc<CR> :source ~/.vim/pack/plugins/start/vim-verilog/autoload/verilog.vim <CR> :noh<CR>
nmap ,v			: e      ~/.vimrc<CR>
nmap ,b			: e      ~/.bash_aliases<CR>
nmap ,t			: !cd ~/projects;ctags -R<CR><CR>
nmap ,1			: e      ~/.vim/pack/plugins/start/vim-snippets/snippets/verilog.snippets<CR>
nmap ,2			: e      ~/.vim/pack/plugins/start/vim-snippets/snippets/c.snippets<CR>
nmap ,3			: e      ~/.vim/pack/plugins/start/vim-verilog/autoload/verilog.vim<CR>
nmap ,q			: q<CR>
nmap ,w			: w<CR>
nmap ,rm		: %s///g<CR>

map ,n			: noh<CR>
map ,aa			: Tabularize /
map ,,i			: call verilog#VInst(0)<CR>
map ,,t			: call verilog#VInst(1)<CR>

map <F2>		: NERDTreeToggle<CR>
map <F3>		: IndentGuidesToggle<CR>
map <F4>		: FloatermNew<CR>
map <F5>		: TagbarToggle<CR>
map	<F7>		: SyntasticToggleMode<CR>
map <F8>		: w <CR> : !ivg	%:r:s?_tb??<CR><CR>
map <F9>		: w <CR> : !iv	%:r:s?_tb??<CR><CR>

map <F11>		: w <CR> : !python3 %<CR><CR>
map <F12>		: w <CR> : !clear; riscv64-unknown-linux-gnu-gcc -march=rv32i -mabi=ilp32 -g -Wall %:t -o %:t:r <CR>
"map <F12>		: w <CR> : !clear; riscv64-unknown-linux-gnu-gcc -march=rv32imac -mabi=ilp32 -g -Wall %:t -o %:t:r <CR>
"map <F12>		: w <CR> : !clear; gcc -g -Wall %:t -o %:t:r && ./%:t:r<CR>
"map <F11>		: VimwikiAll2HTML<CR>
"map <F12>		: %!xxd<CR>
map <C-LEFT>	: tabprev<CR>
map <C-RIGHT>	: tabnext<CR>
map <C-n>		: tabnew<CR>

"inoremap { {}<Esc>ha
"inoremap ( ()<Esc>ha
"inoremap [ []<Esc>ha
"inoremap " ""<Esc>ha
"inoremap ' ''<Esc>ha
"inoremap ` ``<Esc>ha

"==================================================
" Visual Setting
"==================================================
colorscheme gruvbox
syntax  on
"set guifont=Sudo\ 18
"set guifont=Jetbrains\ Mono\ 16
set guifont=Victor\ Mono\ 30
"set lines=32
"set columns=100
set linespace=2
set nocursorcolumn
set nocursorline
set laststatus=2
set incsearch
set lazyredraw
set linebreak
set nolist
set mouse=a
set mousehide
set number
set relativenumber
set numberwidth=4
set ruler
"set scroll=10
set shiftwidth=4
set showbreak=+++\ 
set showcmd
set cmdheight=2
set showmatch
set showtabline=1
set sidescroll=4

set	tw=2000
set nowrap
set sidescroll=2
set sidescrolloff=10 
set	formatoptions-=r

"==================================================
" Editing
"==================================================
set autoindent
set cindent
set smartindent
set smarttab
set expandtab 
set tabstop=4
set noexpandtab
set mps+=<:>
set	wildmenu

"==================================================
" Environment
"==================================================
set autochdir
set autoread
set background=dark
"set background=light
set backspace=indent,eol,start
set confirm
set hlsearch
set history=100
"set ignorecase
"set smartcase
set noignorecase
set loadplugins

"==================================================
" Abbreviate
"==================================================
iabbr	<expr>	__date		strftime("%Y-%m-%d %H:%M:%S")
iabbr	<expr>	__file		expand('%:p')
iabbr	<expr>	__name		expand('%')
iabbr	<expr>	__pwd		expand('%:p:h')

"==================================================
" Additional
"==================================================
filetype on
filetype indent on
filetype plugin on
"set paste

au BufNewFile,BufReadPost Makefile set noexpandtab
au BufNewFile,BufRead *_vim* setf vim

set laststatus=2
set statusline=\(%n\)%<%f\ %h%m%r%=0x%B\ \ \ \ %-14.(%l,%c%V%)\ %P

"When editing a file, always jump to the last known cursor position
au BufReadPost *
 \ if line("'\"") > 0 && line("\"") <= line("$") |
 \   exe "normal g`\"" |
 \ endif
"==================================================
" Functions
"==================================================

function! DisableItalic()
	let his = ''
	redir => his
	silent hi
	redir END
	let his = substitute(his, '\n\s\+', ' ', 'g')
	for line in split(his, "\n")
		if line !~ ' links to ' && line !~ ' cleared$'
			exe 'hi' substitute(substitute(line, ' xxx ', ' ', ''), 'italic', 'none', 'g')
		endif
	endfor
endfunction

function! FontSizePlus ()
    let l:gf_size_whole = matchstr(&guifont, '\(:h\)\@<=\d\+$')
    let l:gf_size_whole = l:gf_size_whole + 1
    let l:new_font_size = ':h'.l:gf_size_whole
    let &guifont = substitute(&guifont, ':h\d\+$', l:new_font_size, '')
endfunction

function! FontSizeMinus ()
	let l:gf_size_whole = matchstr(&guifont, '\(:h\)\@<=\d\+$')
    let l:gf_size_whole = l:gf_size_whole - 1
    let l:new_font_size = ':h'.l:gf_size_whole
    let &guifont = substitute(&guifont, ':h\d\+$', l:new_font_size, '')
endfunction

if has("gui_running")
    nmap zi :call DisableItalic()<CR>
    nmap z[ :call FontSizeMinus()<CR>
    nmap z] :call FontSizePlus()<CR>
endif

"==================================================
" ColorScheme Switch
"==================================================
if v:version < 700 || exists('loaded_switchcolor') || &cp
	finish
endif

let loaded_switchcolor = 1

let paths = split(globpath(&runtimepath, 'colors/*.vim'), "\n")
let s:swcolors = map(paths, 'fnamemodify(v:val, ":t:r")')
let s:swskip = [ '256-jungle', '3dglasses', 'calmar256-light', 'coots-beauty-256', 'grb256' ]
let s:swback = 0    " background variants light/dark was not yet switched
let s:swindex = 0

function! SwitchColor(swinc)
	" if have switched background: dark/light
	if (s:swback == 1)
		let s:swback = 0
		let s:swindex += a:swinc
		let i = s:swindex % len(s:swcolors)

		" in skip list
		if (index(s:swskip, s:swcolors[i]) == -1)
			execute "colorscheme " . s:swcolors[i]
		else
			return SwitchColor(a:swinc)
		endif
	else
		let s:swback = 1
		if (&background == "light")
			execute "set background=dark"
		else
			execute "set background=light"
		endif
		" roll back if background is not supported
		if (!exists('g:colors_name'))
			return SwitchColor(a:swinc)
		endif
	endif
	" show current name on screen. :h :echo-redraw
	redraw
	execute "colorscheme"
endfunction

 map <F6>        :call SwitchColor(1)<CR>
imap <F6>   <Esc>:call SwitchColor(1)<CR>

 map <S-F6>      :call SwitchColor(-1)<CR>
imap <S-F6> <Esc>:call SwitchColor(-1)<CR>

