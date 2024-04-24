""==================================================
"" Bundle Setup
""==================================================
set	rtp+=~/.vim/bundle/gruvbox
set	rtp+=~/.vim/bundle/nerdtree
set	rtp+=~/.vim/bundle/tagbar
set	rtp+=~/.vim/bundle/vim-airline
set	rtp+=~/.vim/bundle/vim-indent-guides
set	rtp+=~/.vim/bundle/jupyter-vim

source ~/.vim/bundle/gruvbox/autoload/gruvbox.vim
source ~/.vim/bundle/nerdtree/plugin/NERD_tree.vim
source ~/.vim/bundle/tagbar/plugin/tagbar.vim
source ~/.vim/bundle/vim-autoread/plugin/autoread.vim
source ~/.vim/bundle/vim-airline/plugin/airline.vim
source ~/.vim/bundle/vim-indent-guides/plugin/indent_guides.vim
source ~/.vim/bundle/jupyter-vim/plugin/jupyter.vim

"==================================================
" Basic Setting
"==================================================
set	nocompatible
set	clipboard=unnamed

"==================================================
" Map Setting
"==================================================
nmap ,s :source ~/.vimrc<cr>
nmap ,v :e      ~/.vimrc<cr>
nmap ,q :q!<cr>
map ,, :<C-X><C-I>

map <F2>			:NERDTreeToggle<CR>
map <F3>			:IndentGuidesToggle<CR>
map <F12>			:%!xxd<CR>
map <C-Left>		:tabprev<CR>
map <C-Right>		:tabnext<CR>
map <C-n>			:tabnew<CR>

map ,m :s/,/\t\t(\t\t),<CR> :noh <CR>
"map	,tb :s/output/wire<CR> :s/input/\treg<CR>
map	,w :s/output/wire<CR>
map	,r :s/input/reg\t<CR>
map ,n :noh<CR>

"==================================================
" Visual Setting
"==================================================
colorscheme gruvbox
syntax  on
"set guifont=Hack:h11
"set guifont=InputMono:h11
"set guifont=Fira\ Code:h12
"set guifont=Ubuntu\ Mono:h12
"set guifont=Sudo\ 18
set guifont=VictorMono\ 18
set linespace=2
set nocursorcolumn
set nocursorline
set laststatus=2
set incsearch
set lazyredraw
set linebreak
set nolist
"set list listchars=tab:¡í\ ,trail:¡¤
set mouse=a
set mousehide
set number
set numberwidth=5
"set pumheight=x
"set rightleft
set ruler
"set scroll=10
set shiftwidth=4
set showbreak=+++\ 
set showcmd
set showmatch
set showtabline=1
set sidescroll=4

set nowrap
set sidescroll=2
set sidescrolloff=10    

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

"set nf=alpha,octal,hex,bin
"set omnifunc=syntaxcomplete#Complete
"set operatorfunc
"set statusline
"set tabline

"==================================================
" Environment
"==================================================
set noautochdir
set autoread
set background=dark
"set background=light
set backspace=indent,eol,start
set nocompatible
set confirm
"set dict=D:\Utils\Configurations\_vimdic
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
iabbr			__always	always @(posedge i_clk) begin
iabbr			__else		else begin<CR>end
iabbr			__elif		else if () begin<CR>end
iabbr			__for		for(i=0;i<xx;i=i+1) begin

"==================================================
" Additional
"==================================================
filetype on
filetype indent on
filetype plugin on

au BufNewFile,BufReadPost Makefile set noexpandtab

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
    let l:gf_size_whole = matchstr(&guifont, '\(\ \)\@<=\d\+$')
    let l:gf_size_whole = l:gf_size_whole + 1
    let l:new_font_size = '\ '.l:gf_size_whole
    let &guifont = substitute(&guifont, '\ \d\+$', l:new_font_size, '')
endfunction

function! FontSizeMinus ()
		let l:gf_size_whole = matchstr(&guifont, '\(\ \)\@<=\d\+$')
    let l:gf_size_whole = l:gf_size_whole - 1
    let l:new_font_size = '\ '.l:gf_size_whole
    let &guifont = substitute(&guifont, '\ \d\+$', l:new_font_size, '')
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


"==================================================
" Jupyter-Vim
"==================================================
if has('nvim')
    let g:python3_host_prog = '/usr/bin/python3'
"else
"    set pyxversion=3
"    " OSX
"    set pythonthreedll=/Library/Frameworks/Python.framework/Versions/3.6/Python
"    " Windows
"    set pythonthreedll=python37.dll
"    set pythonthreehome=C:\Python37
endif
