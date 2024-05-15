" verilog.vim
" Author:       Woong Choi
" Version:      0.0

function! verilog#VInst(dispOption)
	let	l:paramDict		= {}
	let	l:portDict		= {}
	let	l:paramList		= []
	let	l:portList		= []
	let	l:portLineList	= []
	
	" Read Buffer
	if(exists(getreg('+')))
		" ["+]: Specified Register
		let	l:lineList	= split(getreg('+'), "\n")
	else
		" ["0]: Most Recently Yanked Register
		let	l:lineList	= split(getreg('0'), "\n")
	endif

	" Preprocessing
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

	" Variable Initialization
	let	l:maxTapNum = max([4, float2nr(ceil(l:maxStrLen/4.0))])
	let	l:lines = "\t"

	" Define Local Parameters
	if(len(l:paramList))
		for	l:aKey in l:paramList
			let	l:keyTabNum	= len(".".l:aKey)/4.0
			let	l:keyTabStr	= repeat("\t", float2nr(ceil(l:maxTapNum - l:keyTabNum + 1)))
			let	l:lines = l:lines . printf("localparam\t%s%s= %s;\r", l:aKey, l:keyTabStr, l:paramDict[aKey])
		endfor
		let	l:lines = l:lines . printf("\r")
	endif

	" Module Instantiation
	let	l:lines = l:lines . printf("%s\r", l:moduleName)
	if(len(l:paramList))
		let	l:lines = l:lines . printf("#(\r")
		for	l:aKey in l:paramList
			let	l:keyTabNum	= len(".".l:aKey)/4.0
			let	l:valTabNum	= len(".".l:paramDict[l:aKey])/4.0
			let	l:keyTabStr	= repeat("\t", float2nr(ceil(l:maxTapNum - l:keyTabNum + 1)))
			let	l:valTabStr	= repeat("\t", float2nr(ceil(l:maxTapNum - l:valTabNum + 1)))
			if(l:aKey != l:paramList[-1])
				"let	l:lines = l:lines . printf(".%s%s(%s%s),\r", l:aKey, l:keyTabStr, l:paramDict[aKey], l:valTabStr)
				let	l:lines = l:lines . printf(".%s%s(%s%s),\r", l:aKey, l:keyTabStr, l:aKey, l:keyTabStr)
			else
				"let	l:lines = l:lines . printf(".%s%s(%s%s)\r)\r", l:aKey, l:keyTabStr, l:paramDict[aKey], l:valTabStr)
				let	l:lines = l:lines . printf(".%s%s(%s%s)\r)\r", l:aKey, l:keyTabStr, l:aKey, l:keyTabStr)
			endif
		endfor
		let	l:lines = l:lines . printf("u_%s(\r", l:moduleName)
	else
		let	l:lines = l:lines . printf("u_%s(\r", l:moduleName)
	endif

	for	l:portName in l:portList
		let	l:tabNum	= len(".".l:portName)/4.0
		let	l:tabStr	= repeat("\t", float2nr(ceil(l:maxTapNum - l:tabNum + 1)))
		if(l:portName != l:portList[-1])
			let	l:lines = l:lines . printf(".%s%s(%s%s),\r" , l:portName, l:tabStr, l:portName, l:tabStr)
		else
			let	l:lines = l:lines . printf(".%s%s(%s%s)\r);\r", l:portName, l:tabStr, l:portName, l:tabStr)
		endif
	endfor

	if(a:dispOption == 1)
		" Initialization Task
		let	l:lines = l:lines . printf("task init;\r")
		let	l:lines = l:lines . printf("begin\r")
		for	l:aLine in l:portLineList
			if(matchstr(l:aLine, "input") != "")
				let l:portName	= split(l:aLine)[-1]
				let	l:portName	= substitute(l:portName, ',', '', '')
				let	l:tabNum	= len(".".l:portName)/4.0
				let	l:tabStr	= repeat("\t", float2nr(ceil(l:maxTapNum - l:tabNum + 1)))
				let	l:lines = l:lines . printf("%s%s= 0;\r", l:portName, l:tabStr)
			endif
		endfor
		let	l:lines = l:lines . printf("end\r")
		let	l:lines = l:lines . printf("endtask\r")

		" Make Random Input Stimulus
		let l:inputBits	= 0
		let l:iPortList	= [] 
		for	l:portName in l:portList
			let l:portType	= l:portDict[l:portName][0]
			let l:portBits	= l:portDict[l:portName][1]
			if(l:portType == "input")
				let	l:paramList	= add(l:iPortList, l:portName)
				let l:inputBits	= l:inputBits + l:portBits
			endif
		endfor

		let	l:lines = l:lines . printf("//{")
		for	l:portName in l:iPortList
			if(l:portName != l:iPortList[-1])
				let	l:lines = l:lines . printf("%s, ", l:portName)
			else
				let	l:lines = l:lines . printf("%s} = $urandom_range(0, 2**%s-1);", l:portName, l:inputBits)
			endif
		endfor
	endif

	exe	printf(":.normal o%s", l:lines)

endfunction

