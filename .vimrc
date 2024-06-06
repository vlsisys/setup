"==================================================
" Basic Setting
"==================================================
set noautochdir						" Automatically change the working directory when opening files, moving buffers, etc
set	autoindent						" When you type Enter in INSERT mode to go down to the next line, it will automatically indent for you
set	autoread						" If the contents of a file change outside of VIM, it is automatically re-read
set	noautowrite						" Automatically saves files whenever you run certain commands with changes
set	background=dark					" Can only be set to one of two values: dark, light
set	backspace=indent,eol,start		" This option sets the delete function for the <BS> key
set	backup							" Create a backup before overwriting and saving the file
set	backupdir=~/.vim/backup			
set	cedit=<C-f>						" Specify a hotkey to open the History window from the command line
set	cindent							" Automatically apply C-style indentation when editing
set	clipboard=unnamed				" Associating the unnamed register with the clipboard where all copy/delete operations are entered
set clipboard=unnamedplus
set	nocompatible					" Sets the compatibility with the VI
set	complete
set confirm							" Get confirmation from the user when using commands like :q, :bd, etc
set	nocursorcolumn					" Highlights the column where the cursor is located
set	nocursorline					" Highlight the line where the cursor is
set	expandtab						" When you press the tab key, you enter a set number of spaces, not tabs
set	tabstop=4						" Sets how many <Tab>s are replaced by <Space>s. The default is 0.
set	noexpandtab						" When you press the tab key, you enter a set number of spaces, not tabs
set	gdefault						" Setting the g-flag to default when using the :substitute command, i.e. :s
"set guifont=Sudo\ 18
"set guifont=Jetbrains\ Mono\ 16
set guifont=Victor\ Mono\ 24
set guioptions-=m					" Menu bar
set guioptions-=T					" Toolbar
set guioptions-=r					" Right-hand scrollbar
set guioptions-=l					" Left-hand scrollbar

set	hlsearch						" In the search results, highlight the string that matches the search term
set	history=50						" Remembers the history of the command by the specified number
set	ignorecase						" Ignore case when searching (you can search in lowercase as well as uppercase)
set	smartcase						" Don't ignore case if the search term contains capital letters
set	incsearch						" /search to perform a search for each letter entered
set laststatus=2					" Set whether or not to display a status line in the last window
set lazyredraw						" The screen does not update when you are in the middle of an action (such as a macro)
set linebreak						" Lines are truncated on a word-by-word basis
set linespace=0						" Set the distance between rows
set list listchars=tab:`\ ,trail:·	" Represent tabs as ` and spaces, and trailing blanks as 
set	matchpairs+=<:>					" Specifies the pair of parentheses to move to %
set	mouse=a							" Set mouse usage by mode
set	nomousehide						" Hide the mouse pointer while typing
set	nrformats+=alpha				" <C-a>, <C-x> Specify a pattern of numbers to be incremented or decremented
set	number							" Shows the line number on the left side of the screen
set	numberwidth=4					" Sets the width of the line number on the left side of the screen. The default is 4
set	relativenumber					" Show line numbers relative to cursor position
set	ruler							" Show cursor position information in the status line
set	shiftwidth=4					" Specifies the indent length used by cindent, <<, >>. The default is 8
set showbreak=+++\
set	showcmd							" In NORMAL mode, it shows the command you are typing in the lower right corner of the screen
set	showmatch						" Highlight matching parentheses. Defaults to off
set	showtabline=1					" 0: X, 1: default, 2: always
set	smartindent						" When you edit the next line, it will automatically indent it to take into account the programming language syntax
set	smarttab						" When clearing space indents with <BS>, delete on a tab-by-tab basis
set	visualbell						" Notify you on screen when an error occurs without beeping
set	wrap							" Represents long lines that go beyond the screen as multiple lines. Default is on.
set	sidescroll=2
set	sidescrolloff=10
set	list listchars+=extends:»,precedes:< 
set	nolist
"set laststatus=2
"set statusline=\(%n\)%<%f\ %h%m%r%=0x%B\ \ \ \ %-14.(%l,%c%V%)\ %P
set cmdheight=2


filetype on						" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype plugin on				" Enable plugins and load plugin for the detected file type.
filetype indent on				" Load an indent file for the detected file type.
syntax on						" Turn syntax highlighting on.


set	viewdir=~/.vim/view
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

map ga			: Tabularize /

map ,n			: noh<CR>
map ,,i			: call verilog#VInst(0)<CR>
map ,,t			: call verilog#VInst(1)<CR>

map <F2>		: NERDTreeToggle<CR>
map <F3>		: IndentGuidesToggle<CR>
map	<F4>		: SyntasticToggleMode<CR>
map <F5>		: TagbarToggle<CR>
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
syntax  on
"set lines=32
"set columns=100
"set scroll=10

set	tw=2000
set sidescroll=2
set sidescrolloff=10 
set	formatoptions-=r

"==================================================
" Editing
"==================================================
set autoindent
set cindent
set expandtab 
set tabstop=4
set noexpandtab
set mps+=<:>
set	wildmenu

"==================================================
" Environment
"==================================================
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

function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

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

"==================================================
" PlugIn Configurations
"==================================================
" gruvbox
set	background=dark
let	g:gruvbox_contrast_dark='soft'
let	g:gruvbox_italic=0
set	termguicolors
colorscheme	gruvbox

" plugin:nerdtree&tagbar
let g:NERDTreeWinSize = 20
let g:Tlist_WinWidth  = 20

" plugin:syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let	g:syntastic_always_populate_loc_list = 1
let	g:syntastic_auto_loc_list            = 0
let	g:syntastic_check_on_open            = 0
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

