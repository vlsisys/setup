" vim-verilog.vim
" Author:       Woong Choi
" Version:      0.0

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
