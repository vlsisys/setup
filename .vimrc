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
imap <C-J> <Plug>snipMateNextOrTrigger

""==================================================
"" Bundle Configurations
""==================================================
" plugin:nerdtree&tagbar
let g:NERDTreeWinSize = 22
let g:Tlist_WinWidth  = 22

" plugin:ctrlp 
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" plugin:syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 0
let g:syntastic_check_on_open            = 1
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
nmap ,s			: source ~/.vimrc<CR> <ESC> :noh<CR>
nmap ,v			: e      ~/.vimrc<CR>
nmap ,b			: e      ~/.bash_aliases<CR>
nmap ,t			: !cd ~/projects;ctags -R<CR><CR>
nmap ,1			: e      ~/.vim/pack/plugins/start/vim-snippets/snippets/verilog.snippets<CR>
nmap ,2			: e      ~/.vim/pack/plugins/start/vim-snippets/snippets/c.snippets<CR>
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
map <F8>		: !ivg	%:r:s?_tb??<CR>
map <F9>		: !iv	%:r:s?_tb??<CR>

map <F11>		: !python3 %<CR>
map <F12>		: !clear;gcc -Wall %:t -o %:t:r && ./%:t:r<CR>
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
set guifont=Victor\ Mono\ 24
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

"function! VInstance()
"	let	l:paramDict		= {}
"	let	l:portDict		= {}
"	let	l:paramList		= []
"	let	l:portList		= []
"	let	l:portLineList	= []
"	
"	" Read Buffer
"	if(exists(getreg('+')))
"		" ["+]: Specified Register
"		let	l:lineList	= split(getreg('+'), "\n")
"	else
"		" ["0]: Most Recently Yanked Register
"		let	l:lineList	= split(getreg('0'), "\n")
"	endif
"
"	" Preprocessing
"	let	l:maxStrLen	= 0
"	for	l:line in l:lineList
"		if(matchstr(l:line, "module") != "")
"			let	l:moduleName	= split(l:line)[1]
"			let	l:moduleName	= substitute(l:moduleName, '#', '', '')
"			let	l:moduleName	= substitute(l:moduleName, '(', '', '')
"		endif
"		if(matchstr(l:line, "parameter") != "")
"			let l:aParam	= split(l:line)[1]
"			let l:aValue	= split(l:line)[3]
"			let	l:aValue	= substitute(l:aValue, ',', '', '')
"			let	l:paramDict[l:aParam]	= l:aValue
"			let	l:paramList	= add(l:paramList, l:aParam)
"			if(l:maxStrLen < len(l:aParam))
"				let l:maxStrLen	= len(l:aParam)
"			endif
"		endif
"		if(matchstr(l:line, "input") != "" || matchstr(l:line, "output") != "" || matchstr(l:line, "inout") != "")
"			let l:portName	= split(l:line)[-1]
"			let	l:portName	= substitute(l:portName, ',', '', '')
"			let	l:portList	= add(l:portList, l:portName)
"			let l:portType	= split(l:line)[0]
"			let	l:portLineList	= add(l:portLineList, l:line)
"			if(stridx(l:line, "[") != -1)
"				let l:portIdxL	= str2nr(l:line[stridx(l:line,"[")+1:stridx(l:line,":")-1])
"				let l:portIdxR	= str2nr(l:line[stridx(l:line,":")+1:stridx(l:line,"]")-1])
"				let	l:portBits	= abs(l:portIdxL-l:portIdxR) + 1
"			else
"				let	l:portBits	= 1
"			endif
"			let	l:portDict[l:portName]	= [l:portType, l:portBits]
"			if(l:maxStrLen < len(l:portName))
"				let l:maxStrLen	= len(l:portName)
"			endif
"		endif
"	endfor
"
"	" Variable Initialization
"	let	l:maxTapNum = max([4, float2nr(ceil(l:maxStrLen/4.0))])
"	let	l:lines = "\t"
"
"	" Define Local Parameters
"	if(len(l:paramList))
"		for	l:aKey in l:paramList
"			let	l:keyTabNum	= len(".".l:aKey)/4.0
"			let	l:keyTabStr	= repeat("\t", float2nr(ceil(l:maxTapNum - l:keyTabNum + 1)))
"			let	l:lines = l:lines . printf("localparam\t%s%s= %s;\r", l:aKey, l:keyTabStr, l:paramDict[aKey])
"		endfor
"		let	l:lines = l:lines . printf("\r")
"	endif
"
"	" Signals for Testbench
"	for	l:aLine in l:portLineList
"		let	l:aLineOrig	= l:aLine
"		let	l:aLine	= substitute(l:aLine, '\s\+output\s\+reg', 'wire', '')
"		let	l:aLine	= substitute(l:aLine, '\s\+output', 'wire', '')
"		let	l:aLine	= substitute(l:aLine, '\s\+inout', 'reg', '')
"		let	l:aLine	= substitute(l:aLine, '\s\+input', 'reg', '')
"		let	l:aLine	= substitute(l:aLine, ',', ';', '')
"   		if(l:aLineOrig != l:portLineList[-1])
"			let	l:lines = l:lines . printf("%s\r", l:aLine)
"		else
"			let	l:lines = l:lines . printf("%s;\r\r", l:aLine)
"		endif
"	endfor
"
"	" Port Mapping
"	let	l:lines = l:lines . printf("%s\r", l:moduleName)
"	if(len(l:paramList))
"		let	l:lines = l:lines . printf("#(\r")
"		for	l:aKey in l:paramList
"			let	l:keyTabNum	= len(".".l:aKey)/4.0
"			let	l:valTabNum	= len(".".l:paramDict[l:aKey])/4.0
"			let	l:keyTabStr	= repeat("\t", float2nr(ceil(l:maxTapNum - l:keyTabNum + 1)))
"			let	l:valTabStr	= repeat("\t", float2nr(ceil(l:maxTapNum - l:valTabNum + 1)))
"			if(l:aKey != l:paramList[-1])
"				"let	l:lines = l:lines . printf(".%s%s(%s%s),\r", l:aKey, l:keyTabStr, l:paramDict[aKey], l:valTabStr)
"				let	l:lines = l:lines . printf(".%s%s(%s%s),\r", l:aKey, l:keyTabStr, l:aKey, l:keyTabStr)
"			else
"				"let	l:lines = l:lines . printf(".%s%s(%s%s)\r)\r", l:aKey, l:keyTabStr, l:paramDict[aKey], l:valTabStr)
"				let	l:lines = l:lines . printf(".%s%s(%s%s)\r)\r", l:aKey, l:keyTabStr, l:aKey, l:keyTabStr)
"			endif
"		endfor
"		let	l:lines = l:lines . printf("u_%s(\r", l:moduleName)
"	else
"		let	l:lines = l:lines . printf("u_%s(\r", l:moduleName)
"	endif
"
"	for	l:portName in l:portList
"		let	l:tabNum	= len(".".l:portName)/4.0
"		let	l:tabStr	= repeat("\t", float2nr(ceil(l:maxTapNum - l:tabNum + 1)))
"		if(l:portName != l:portList[-1])
"			let	l:lines = l:lines . printf(".%s%s(%s%s),\r" , l:portName, l:tabStr, l:portName, l:tabStr)
"		else
"			let	l:lines = l:lines . printf(".%s%s(%s%s)\r);\r", l:portName, l:tabStr, l:portName, l:tabStr)
"		endif
"	endfor
"
"	" Initialization Task
"	let	l:lines = l:lines . printf("task init;\r")
"	let	l:lines = l:lines . printf("begin\r")
"	for	l:aLine in l:portLineList
"		if(matchstr(l:aLine, "input") != "")
"			let l:portName	= split(l:aLine)[-1]
"			let	l:portName	= substitute(l:portName, ',', '', '')
"			let	l:tabNum	= len(".".l:portName)/4.0
"			let	l:tabStr	= repeat("\t", float2nr(ceil(l:maxTapNum - l:tabNum + 1)))
"			let	l:lines = l:lines . printf("%s%s= 0;\r", l:portName, l:tabStr)
"		endif
"	endfor
"	let	l:lines = l:lines . printf("end\r")
"	let	l:lines = l:lines . printf("endtask\r")
"
"	" Make Random Input Stimulus
"	let l:inputBits	= 0
"	let l:iPortList	= [] 
"	for	l:portName in l:portList
"		let l:portType	= l:portDict[l:portName][0]
"		let l:portBits	= l:portDict[l:portName][1]
"		if(l:portType == "input")
"			let	l:paramList	= add(l:iPortList, l:portName)
"			let l:inputBits	= l:inputBits + l:portBits
"		endif
"	endfor
"
"	let	l:lines = l:lines . printf("//{")
"	for	l:portName in l:iPortList
"		if(l:portName != l:iPortList[-1])
"			let	l:lines = l:lines . printf("%s, ", l:portName)
"		else
"			let	l:lines = l:lines . printf("%s} = $urandom_range(0, 2**%s-1);", l:portName, l:inputBits)
"		endif
"	endfor
"
"	exe	printf(":.normal o%s", l:lines)
"
"endfunction
