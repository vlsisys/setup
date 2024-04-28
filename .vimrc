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
set	rtp+=~/.vim/pack/plugins/start/vim-diminactive
set	rtp+=~/.vim/pack/plugins/start/vim-indent-guides
set	rtp+=~/.vim/pack/plugins/start/vim-verilog-instance

set	rtp+=~/.vim/pack/plugins/start/tlib_vim
set	rtp+=~/.vim/pack/plugins/start/vim-addon-mw-utils
set	rtp+=~/.vim/pack/plugins/start/vim-snippets
set	rtp+=~/.vim/pack/plugins/start/vim-snipmate
imap <C-J> <Plug>snipMateNextOrTrigger

""==================================================
"" Bundle Configurations
""==================================================
" plugin:nerdtree&tagbar
let g:NERDTreeWinSize = 18
let g:Tlist_WinWidth  = 32

" plugin:ctrlp 
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" plugin:syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 1
let g:syntastic_check_on_open            = 1
let g:syntastic_check_on_wq              = 0
let g:syntastic_error_symbol             = 'E'
let g:syntastic_warning_symbol           = 'W'
let g:syntastic_loc_list_height          = 3
let g:syntastic_verilog_checkers         = ['iverilog']
let g:syntastic_python_checkers          = ['python']
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
augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END

"==================================================
" Map Setting
"==================================================
nmap ,s			: source ~/.vimrc<CR>
nmap ,v			: e      ~/.vimrc<CR>
nmap ,q			: q!<CR>

map ,n			: noh<CR>
map ,aa			: Tabularize /

map <F2>		: NERDTreeToggle<CR>
map <F3>		: IndentGuidesToggle<CR>
map <F4>		: FloatermNew<CR>
map <F10>		: TagbarToggle<CR>
map <F11>		: VimwikiAll2HTML<CR>
map <F12>		: %!xxd<CR>
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
"set guifont=Sudo:h13
""set guifont=Jetbrains\ Mono:h10
""set guifont=Iosevka:h10
set guifont=Victor\ Mono:h11
set linespace=4
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
set numberwidth=6
set ruler
"set scroll=10
set shiftwidth=4
set showbreak=+++\ 
set showcmd
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
iabbr	<expr>	__branch	system("git rev-parse --abbrev-ref HEAD")
iabbr	<expr>	__tcsh		system("which tcsh")

iabbr			__email		woongchoi@sm.ac.kr
"==================================================
" Additional
"==================================================
filetype on
filetype indent on
filetype plugin on
"set paste

au BufNewFile,BufReadPost Makefile set noexpandtab
au BufNewFile,BufRead *_vim* setf vim

set showcmd
set cmdheight=1
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

 map <F8>        :call SwitchColor(1)<CR>
imap <F8>   <Esc>:call SwitchColor(1)<CR>

 map <S-F8>      :call SwitchColor(-1)<CR>
imap <S-F8> <Esc>:call SwitchColor(-1)<CR>
