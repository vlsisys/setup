"==================================================
" Basic Setting: Visual
"==================================================
set	background=dark				" Can only be set to one of two values: dark, light
set cmdheight=1					" Number of screen lines to use for the command-line
set	nocursorcolumn				" Highlights the column where the cursor is located
set	nocursorline				" Highlight the line where the cursor is
set guioptions-=m
set guioptions-=T
set guioptions-=l
set guioptions-=r
set guioptions-=b				"m: menu, T: toolbar, l,r,b: scrollbar
set guifont=Victor\ Mono\ Light\ 12
set laststatus=2				" Set whether or not to display a status line in the last window
set lazyredraw					" The screen does not update when you are in the middle of an action (such as a macro)
set linebreak					" Lines are truncated on a word-by-word basis
set linespace=2					" Set the distance between rows, default is 0
set	number						" Shows the line number on the left side of the screen
set	numberwidth=4				" Sets the width of the line number on the left side of the screen. The default is 4
set	relativenumber				" Show line numbers relative to cursor position
set	ruler						" Show cursor position information in the status line
set	showcmd						" In NORMAL mode, it shows the command you are typing in the lower right corner of the screen
set	showmatch					" Highlight matching parentheses. Defaults to off
set	showtabline=1				" 0: X, 1: default, 2: always
set showbreak=+++\ 				" w/ wrap
set	sidescroll=2				" w/ wrap
set	sidescrolloff=10			" w/ wrap
set	nowrap						" Represents long lines that go beyond the screen as multiple lines. Default is on.
set	listchars=					" reset
set	listchars+=extends:» 
set	listchars+=precedes:< 
set listchars+=tab:>-
set listchars+=trail:·			" Represent tabs as ` and spaces, and trailing blanks as 
set	nolist	
set	wildmenu					" Extend command-line autocomplete to make it more convenient
set	wildmode=list:full			" wildmenu display option
set	viewdir=~/.vim/view			" Directory for vim view file
set	textwidth=0
set	wrapmargin=1

augroup remember_folds
	autocmd!
	autocmd BufWinLeave *.* mkview
	autocmd BufWinEnter *.* silent! loadview
augroup END

"autocmd FileType c      setlocal foldmethod=expr foldexpr=getline(v:lnum)=~'^\\s*//'
"autocmd FileType python setlocal foldmethod=expr foldexpr=getline(v:lnum)=~'^\\s*#'
"==================================================
" Basic Setting: Vim Env. & Editing
"==================================================
set loadplugins
filetype plugin indent on		" Enable type file detection. Vim will be able to try to detect the type of file in use.
"filetype plugin on				" Enable plugins and load plugin for the detected file type.
"filetype indent on				" Load an indent file for the detected file type.
syntax on						" Turn syntax highlighting on.

set	tags=~/projects/tags

set autochdir					" Automatically change the working directory when opening files, moving buffers, etc
set	autoindent					" When you type Enter in INSERT mode to go down to the next line, it will automatically indent for you
set	autoread					" If the contents of a file change outside of VIM, it is automatically re-read
set	noautowrite					" Automatically saves files whenever you run certain commands with changes
set	backspace=indent,eol,start	" This option sets the delete function for the <BS> key
set	backup						" Create a backup before overwriting and saving the file
set	backupdir=~/.vim/backup		
set	cindent						" Automatically apply C-style indentation when editing
"set	clipboard=unnamed			" Associating the unnamed register with the clipboard where all copy/delete operations are entered
set clipboard+=exclude:.*
set	nocompatible				" Sets the compatibility with the VI
"set	complete
set confirm						" Get confirmation from the user when using commands like :q, :bd, etc
set	noexpandtab					" When you press the tab key, you enter a set number of spaces, not tabs
set	tabstop=4					" Sets how many <Tab>s are replaced by <Space>s. The default is 0.
set	shiftwidth=4				" Specifies the indent length used by cindent, <<, >>. The default is 8
set	nogdefault					" Setting the g-flag to default when using the :substitute command, i.e. :s
set	hlsearch					" In the search results, highlight the string that matches the search term
set	history=50					" Remembers the history of the command by the specified number
set	ignorecase					" Ignore case when searching (you can search in lowercase as well as uppercase)
set	incsearch					" /search to perform a search for each letter entered
set	smartcase					" Don't ignore case if the search term contains capital letters
set	matchpairs+=<:>				" Specifies the pair of parentheses to move to %
set	mouse=a						" Set mouse usage by mode
set	nomousehide					" Hide the mouse pointer while typing
set	nrformats+=alpha			" <C-a>, <C-x> Specify a pattern of numbers to be incremented or decremented
set	smartindent					" When you edit the next line, it will automatically indent it to take into account the programming language syntax
set	smarttab					" When clearing space indents with <BS>, delete on a tab-by-tab basis
set	visualbell					" Notify you on screen when an error occurs without beeping

"==================================================
" PlugIn Configurations
"==================================================
" gruvbox
set	background=dark
"let	g:gruvbox_contrast_dark='soft'
"let	g:gruvbox_contrast_dark='hard'
let	g:gruvbox_italic=1
set	termguicolors
colorscheme	gruvbox

" plugin:nerdtree&tagbar
let g:NERDTreeWinSize=20

" plugin:syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let	g:syntastic_always_populate_loc_list = 1
let	g:syntastic_auto_loc_list            = 1
let	g:syntastic_check_on_open            = 1
let	g:syntastic_check_on_wq              = 1
let	g:syntastic_error_symbol             = 'E'
let	g:syntastic_warning_symbol           = 'W'
let	g:syntastic_loc_list_height          = 4
let	g:syntastic_verilog_checkers         = ['iverilog']
let	g:syntastic_python_checkers          = ['python3']
let	g:syntastic_cpp_compiler             = 'g++'
let	g:syntastic_cpp_compiler_options     = '-std=c++14'

" plugin:snipMate
imap <C-J> <Plug>snipMateNextOrTrigger

" for indent conflict during verilog coding
autocmd	FileType * setlocal comments-=://
set	formatoptions-=r
au		BufNewFile,BufRead *.v		setf verilog
"==================================================
" Map Setting
"==================================================
nmap ,s			:w<CR> :source ~/.vimrc<CR> :noh<CR>
nmap ,v			:e	~/.vimrc<CR>
nmap ,b			:e  ~/.bash_aliases<CR>
nmap ,t			:!cd ~/projects;ctags -R<CR><CR>
nmap ,1			:e	~/.vim/pack/plugins/start/vim-snippets/snippets/verilog.snippets<CR>
nmap ,2			:e	~/.vim/pack/plugins/start/vim-snippets/snippets/c.snippets<CR>
nmap ,3			:e	~/.vim/pack/custom/start/vim-verilog/autoload/verilog.vim<CR>
nmap ,4			:e	~/.vim/pack/custom/start/vim-functions/autoload/cstFuncs.vim<CR>
nmap ,q			:q<CR>
nmap ,w			:w<CR>

nmap f*			:call cstFuncs#FontChange()<CR>
nmap f[			:call cstFuncs#FontSizeMod(-1)<CR>
nmap f]			:call cstFuncs#FontSizeMod(+1)<CR>
nmap s[			:call cstFuncs#LineSpace(-1)<CR>
nmap s]			:call cstFuncs#LineSpace(+1)<CR>
nmap c[			:call cstFuncs#CMDHeight(-1)<CR>
nmap c]			:call cstFuncs#CMDHeight(+1)<CR>

nmap \n			:call cstFuncs#ToggleRelativeNumber()<CR>
nmap \l			:call cstFuncs#ToggleCursorLine()<CR>
nmap \c			:call cstFuncs#ToggleListChars()<CR>
nmap \m			:call cstFuncs#ToggleGUIMenu()<CR>

map ga			:Tabularize /

map ,n			:noh<CR>
map ,f			:%! find ./ -type f \| xargs grep -i "
map ,,i			:call verilog#VInst(0)<CR>
map ,,t			:call verilog#VInst(1)<CR>

map <F2>		:NERDTreeToggle<CR>
map <F3>		:IndentGuidesToggle<CR>
map	<F4>		:SyntasticToggleMode<CR>
map <F5>		:TagbarToggle<CR>
map <F8>		:w <CR> :!ivg	%:r:s?_tb??<CR><CR>
map <F9>		:w <CR> :!iv	%:r:s?_tb??<CR><CR>
map	<F10>		:w <CR> :!yosys -p "read_verilog % ; hierarchy -check; synth;" > ./log/yosys.log<CR> :!gvim ./log/yosys.log<CR>

"map <F11>		: w <CR> : !python3 %<CR><CR>
map <F11>		: w <CR> : !gem5 %:r<CR><CR>
map <F12>		: w <CR> : !clear; riscv64-unknown-linux-gnu-gcc -march=rv32i -mabi=ilp32 -g -Wall %:t -o %:t:r <CR>
"map <F12>		: w <CR> : !clear; riscv64-unknown-linux-gnu-gcc -march=rv32imac -mabi=ilp32 -g -Wall %:t -o %:t:r <CR>
"map <F12>		: w <CR> : !clear; gcc -g -Wall %:t -o %:t:r && ./%:t:r<CR>
"map <F11>		: VimwikiAll2HTML<CR>
"map <F12>		: %!xxd<CR>
map <C-LEFT>	: tabprev<CR>
map <C-RIGHT>	: tabnext<CR>
map <C-n>		: tabnew<CR>

"==================================================
" Abbreviate
"==================================================
iabbr	<expr>	__date		strftime("%Y-%m-%d %H:%M:%S")
iabbr	<expr>	__file		expand('%:p')
iabbr	<expr>	__name		expand('%')
iabbr	<expr>	__pwd		expand('%:p:h')
