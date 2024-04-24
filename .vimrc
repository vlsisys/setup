""==================================================
"" Bundle Setup
""==================================================
set		rtp+=~/.vim/bundle/gruvbox
set		rtp+=~/.vim/bundle/nerdtree
set		rtp+=~/.vim/bundle/tagbar
set		rtp+=~/.vim/bundle/fzf
set		rtp+=~/.vim/bundle/vim-wiki
set		rtp+=~/.vim/bundle/vim-autoread
set		rtp+=~/.vim/bundle/vim-airline
set		rtp+=~/.vim/bundle/vim-indent-guides
set		rtp+=~/.vim/bundle/vim-floaterm

source	~/.vim/bundle/gruvbox/autoload/gruvbox.vim
source	~/.vim/bundle/nerdtree/plugin/NERD_tree.vim
source	~/.vim/bundle/tagbar/plugin/tagbar.vim
source	~/.vim/bundle/fzf/plugin/fzf.vim
source	~/.vim/bundle/vim-wiki/plugin/vimwiki.vim
source	~/.vim/bundle/vim-autoread/plugin/autoread.vim
source	~/.vim/bundle/vim-airline/plugin/airline.vim
source	~/.vim/bundle/vim-indent-guides/plugin/indent_guides.vim
source	~/.vim/bundle/vim-floaterm/plugin/floaterm.vim

let g:NERDTreeWinSize=16
let g:Tlist_WinWidth=32
"=================================================
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
nmap ,s :source ~/.vimrc<CR>
nmap ,v :e      ~/.vimrc<CR>
nmap ,q :q!<CR>

map <F2>			:NERDTreeToggle<CR>
map <F3>			:IndentGuidesToggle<CR>
map <F4>			:FloatermNew<CR>
map <F10>			:TagbarToggle<CR>
map <F11>			:VimwikiAll2HTML<CR>
map <F12>			:%!xxd<CR>
map <C-LEFT>		:tabprev<CR>
map <C-RIGHT>		:tabnext<CR>
map <C-n>			:tabnew<CR>

map ,n :noh<CR>
"map ,` :s/output/wire/<CR> :'<,'>s/input/reg\t/<CR> :'<,'>s/,/;/<CR> :noh<CR> j<S-a>; <ESC> j
"map ,1 :s/module\s\+/\t/<CR> :'<,'>s/output\s\+/\t./<CR> :'<,'>s/input\s\+/\t./<CR> :'<,'>s/,/\t\t(\t\t),<CR> j<S-a>		(		)); <ESC> :'<,'>s/^\t\w\+/&\tu_&/<CR> :'<,'>s/u_\t/u_/<CR> :noh <CR> 
"map ,2 :s/module\s\+/\t/<CR> :'<,'>s/output\s\+/\t./<CR> :'<,'>s/input\s\+/\t./<CR> :'<,'>s/\.\w\+/&\t\t(&\t\t)<CR> <S-a>); <ESC> :'<,'>s/^\t\w\+/&\tu_&/<CR> :'<,'>s/u_\t/u_/<CR> :'<,'>s/(\./(/<CR> :noh <CR> 
map	,1	<ESC> :call VerilogInstance()<CR> 

map ,q i	always @(posedge i_clk or negedge i_rstn) begin <CR><CR>end <ESC>

inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha
"==================================================
" Visual Setting
"==================================================
colorscheme gruvbox
syntax  on
"set guifont=Sudo:h13
"set guifont=Jetbrains\ Mono:h10
set guifont=Victor\ Mono:h10
set linespace=4
set nocursorcolumn
set nocursorline
set laststatus=2
set incsearch
set lazyredraw
set linebreak
set nolist
"set list listchars=tab:??\ ,trail:??
set mouse=a
set mousehide
set number
set numberwidth=6
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
function! VerilogInstance()
	let	l:paramDict		= {}
	let	l:portDict		= {}
	let	l:paramList		= []
	let	l:portList		= []
	let	l:portLineList	= []
	if(exists(getreg('+')))
		let	l:lineList	= split(getreg('+'), "\n")
	else
		let	l:lineList	= split(getreg('0'), "\n")
	endif
	let	l:maxStrLen	= 0
	for	l:line in l:lineList
		if(matchstr(l:line, "module") != "")
			let	l:moduleName	= split(l:line)[1]
			let	l:moduleName	= substitute(l:moduleName, '#', '', '')
			let	l:moduleName	= substitute(l:moduleName, '(', '', '')
		endif
		if(matchstr(l:line, "parameter") != "")
			let l:aParam	= split(l:line)[1]
			let l:aValue	= split(l:line)[3]
			let	l:aValue	= substitute(l:aValue, ',', '', '')
			let	l:paramDict[l:aParam]	= l:aValue
			let	l:paramList	= add(l:paramList, l:aParam)
			if(l:maxStrLen < len(l:aParam))
				let l:maxStrLen	= len(l:aParam)
			endif
		endif
		if(matchstr(l:line, "input") != "" || matchstr(l:line, "output") != "" || matchstr(l:line, "inout") != "")
			let l:portName	= split(l:line)[-1]
			let	l:portName	= substitute(l:portName, ',', '', '')
			let	l:portList	= add(l:portList, l:portName)
			let l:portType	= split(l:line)[0]
			let	l:portLineList	= add(l:portLineList, l:line)
			if(stridx(l:line, "[") != -1)
				let l:portIdxL	= str2nr(l:line[stridx(l:line,"[")+1:stridx(l:line,":")-1])
				let l:portIdxR	= str2nr(l:line[stridx(l:line,":")+1:stridx(l:line,"]")-1])
				let	l:portBits	= abs(l:portIdxL-l:portIdxR) + 1
			else
				let	l:portBits	= 1
			endif
			let	l:portDict[l:portName]	= [l:portType, l:portBits]
			if(l:maxStrLen < len(l:portName))
				let l:maxStrLen	= len(l:portName)
			endif
		endif
	endfor

	let	l:maxTapNum = max([4, float2nr(ceil(l:maxStrLen/4.0))])

	let	l:lines = ""

	for	l:aLine in l:portLineList
		let	l:aLineOrig	= l:aLine
		let	l:aLine	= substitute(l:aLine, '\s\+output\s\+reg', 'wire', '')
		let	l:aLine	= substitute(l:aLine, '\s\+output', 'wire', '')
		let	l:aLine	= substitute(l:aLine, '\s\+inout', 'reg', '')
		let	l:aLine	= substitute(l:aLine, '\s\+input', 'reg', '')
		let	l:aLine	= substitute(l:aLine, ',', ';', '')
   		if(l:aLineOrig != l:portLineList[-1])
			let	l:lines = l:lines . printf("%s\n", l:aLine)
		else
			let	l:lines = l:lines . printf("%s;\n\n", l:aLine)
		endif
	endfor

	let	l:lines = l:lines . printf("%s", l:moduleName)
	if(len(l:paramList))
		let	l:lines = l:lines . printf("#(\n")
		for	l:aKey in l:paramList
			let	l:keyTabNum	= float2nr(ceil(len(".".l:aKey)/4.0))
			let	l:valTabNum	= float2nr(ceil(len(".".l:paramDict[l:aKey])/4.0))
			let	l:keyTabStr	= repeat("\t", l:maxTapNum - l:keyTabNum + 1)
			let	l:valTabStr	= repeat("\t", l:maxTapNum - l:valTabNum + 1)
			if(l:aKey != l:paramList[-1])
				let	l:lines = l:lines . printf(".%s%s(%s%s),\n", l:aKey, l:keyTabStr, l:paramDict[aKey], l:valTabStr)
			else
				let	l:lines = l:lines . printf(".%s%s(%s%s))\n", l:aKey, l:keyTabStr, l:paramDict[aKey], l:valTabStr)
			endif
		endfor
		let	l:lines = l:lines . printf("\bu_%s(\n", l:moduleName)
	else
		let	l:lines = l:lines . printf("\tu_%s(\n", l:moduleName)
	endif

	for	l:portName in l:portList
		let	l:tabNum	= float2nr(ceil(len(".".l:portName)/4.0))
		let	l:tabStr	= repeat("\t", l:maxTapNum - l:tabNum + 1)
		if(l:portName != l:portList[-1])
			let	l:lines = l:lines . printf(".%s%s(%s%s),\t//%s-bit\n" , l:portName, l:tabStr, l:portName, l:tabStr, l:portDict[l:portName][1])
		else
			let	l:lines = l:lines . printf(".%s%s(%s%s));\t//%s-bit\n", l:portName, l:tabStr, l:portName, l:tabStr, l:portDict[l:portName][1])
		endif
	endfor

	exe	printf(":.normal o%s", l:lines)
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
