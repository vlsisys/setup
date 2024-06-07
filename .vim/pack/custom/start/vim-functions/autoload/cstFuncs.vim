"==================================================
" Functions
"==================================================
function! cstFuncs#FontSizeMod(addNum)
	let l:gf_size_whole = matchstr(&guifont, '\( \)\@<=\d\+$')
	let l:gf_size_whole = l:gf_size_whole + a:addNum
	let l:new_font_size = ' '.l:gf_size_whole
	let &guifont = substitute(&guifont, ' \d\+$', l:new_font_size, '')
endfunction

function! cstFuncs#FontChange()
	set guifont=*
endfunc

function! cstFuncs#LineSpace(addNum)
	let &linespace = &linespace + a:addNum
endfunction

function! cstFuncs#CMDHeight(addNum)
	let &cmdheight = &cmdheight + a:addNum
endfunction

function! cstFuncs#ToggleRelativeNumber()
	if(&relativenumber == 1)
		set norelativenumber
		set number
	else
		set relativenumber
	endif
endfunc

function! cstFuncs#ToggleCursorLine()
	if(&cursorline== 1)
		set nocursorline
	else
		set cursorline
	endif
endfunc

function! cstFuncs#ToggleListChars()
	if(&list== 1)
		set nolist
	else
		set list
	endif
endfunc

function! cstFuncs#ToggleWrap()
	if(&wrap== 1)
		set nowrap
	else
		set wrap
	endif
endfunc

function! cstFuncs#ToggleGUIMenu()
	if(matchstr(&guioptions, 'm') == 'm')
		set guioptions-=m
	else
		set guioptions+=m
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

nmap <F6>		:call SwitchColor(+1)<CR>
nmap <S-F6>		:call SwitchColor(-1)<CR>
