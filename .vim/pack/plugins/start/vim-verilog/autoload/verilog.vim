" verilog.vim
" Author:       Woong Choi
" Version:      0.0

function! verilog#VInst(printOpt)
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
			let	l:keyTabStr	= repeat("\t", float2nr(ceil(l:maxTapNum - l:keyTabNum)))
			let	l:lines = l:lines . printf("localparam\t%s%s= %s;\r", l:aKey, l:keyTabStr, l:paramDict[aKey])
		endfor
		let	l:lines = l:lines . printf("\r")
	endif

	" Signals for TestBench (output -> wire, input -> reg)
	if(a:printOpt == 1)
		for	l:aLine in l:portLineList
			let	l:aLineOrig	= l:aLine
			let	l:aLine	= substitute(l:aLine , '\s\+output\s\+reg' , 'wire' , '')
			let	l:aLine	= substitute(l:aLine , '\s\+output\t'      , 'wire' , '')
			let	l:aLine	= substitute(l:aLine , '\s\+inout'         , 'reg'  , '')
			let	l:aLine	= substitute(l:aLine , '\s\+input'         , 'reg'  , '')
			let	l:aLine	= substitute(l:aLine , 'BW'                , '`BW'  , '')
			let	l:aLine	= substitute(l:aLine , ','                 , ';' , '')
   			if(l:aLineOrig != l:portLineList[-1])
				let	l:lines = l:lines . printf("%s\r", l:aLine)
			else
				let	l:lines = l:lines . printf("%s;\r\r", l:aLine)
			endif
		endfor
	endif

	" Module Instantiation
	let	l:lines = l:lines . printf("%s\r", l:moduleName)
	if(len(l:paramList))
		let	l:lines = l:lines . printf("#(\r")
		for	l:aKey in l:paramList
			let	l:keyTabNum	= len(".".l:aKey)/4.0
			let	l:valTabNum	= len(".".l:paramDict[l:aKey])/4.0
			let	l:keyTabStr	= repeat("\t", float2nr(ceil(l:maxTapNum - l:keyTabNum)))
			let	l:valTabStr	= repeat("\t", float2nr(ceil(l:maxTapNum - l:valTabNum)))
			if(l:aKey != l:paramList[-1])
				"let	l:lines = l:lines . printf(".%s%s(%s%s),\r", l:aKey, l:keyTabStr, l:paramDict[aKey], l:valTabStr)
				let	l:lines = l:lines . printf(".%s%s(%s%s),\r", l:aKey, l:keyTabStr, "`".l:aKey, l:keyTabStr)
			else
				"let	l:lines = l:lines . printf(".%s%s(%s%s)\r)\r", l:aKey, l:keyTabStr, l:paramDict[aKey], l:valTabStr)
				let	l:lines = l:lines . printf(".%s%s(%s%s)\r)\r", l:aKey, l:keyTabStr, "`".l:aKey, l:keyTabStr)
			endif
		endfor
		let	l:lines = l:lines . printf("u_%s(\r", l:moduleName)
	else
		let	l:lines = l:lines . printf("u_%s(\r", l:moduleName)
	endif

	for	l:portName in l:portList
		let	l:tabNum	= len(".".l:portName)/4.0
		let	l:tabStr	= repeat("\t", float2nr(ceil(l:maxTapNum - l:tabNum)))
		if(l:portName != l:portList[-1])
			let	l:lines = l:lines . printf(".%s%s(%s%s),\r" , l:portName, l:tabStr, l:portName, l:tabStr)
		else
			let	l:lines = l:lines . printf(".%s%s(%s%s)\r);\r\r", l:portName, l:tabStr, l:portName, l:tabStr)
		endif
	endfor

	if(a:printOpt == 1)

		" Clock
		for	l:portName in l:portList
			if(matchstr(l:portName, "clk") != "") 
				let	l:lines = l:lines . printf("\b")
				let	l:lines = l:lines . printf("// --------------------------------------------------\r")
				let	l:lines = l:lines . printf("//	Clock\r")
				let	l:lines = l:lines . printf("// --------------------------------------------------\r\t")
				let	l:lines = l:lines . printf("reg							i_clk = 0;\r")
				let	l:lines = l:lines . printf("always	#(500/`CLKFREQ)		i_clk = ~i_clk;\r\r")
			endif
		endfor

		" Test Vector Configuration
		let	l:lines = l:lines . printf("\b")
		let	l:lines = l:lines . printf("// --------------------------------------------------\r")
		let	l:lines = l:lines . printf("//	Test Vector Configuration\r")
		let	l:lines = l:lines . printf("// --------------------------------------------------\r\t")
		for	l:aLine in l:portLineList
			let	l:aLineOrig	= l:aLine
			let	l:aLine	= substitute(l:aLine , '\s\+output\s\+reg' , 'reg\t'       , '')
			let	l:aLine	= substitute(l:aLine , '\s\+output\t'      , 'reg\t'       , '')
			let	l:aLine	= substitute(l:aLine , '\s\+inout'         , 'reg'         , '')
			let	l:aLine	= substitute(l:aLine , '\s\+input'         , 'reg'         , '')
			let	l:aLine	= substitute(l:aLine , 'BW'                , '`BW'         , '')
			let	l:aLine	= substitute(l:aLine , 'o_'                , 'vo_'         , '')
			let	l:aLine	= substitute(l:aLine , 'i_'                , 'vi_'         , '')
			let	l:aLine	= substitute(l:aLine , ','                 , '[0:`NVEC-1];' , '')
   			if(l:aLineOrig != l:portLineList[-1])
				let	l:lines = l:lines . printf("%s\r", l:aLine)
			else
				let	l:lines = l:lines . printf("%s[0:`NVEC-1];\r\r", l:aLine)
			endif
		endfor

		let	l:lines = l:lines . printf("initial begin\r")

		for	l:portName in l:portList
			let	l:tabNum	= (len(l:portName)+5)/4.0
			let	l:tabStr	= repeat("\t", float2nr(ceil(l:maxTapNum - l:tabNum)))
			if(l:portName != l:portList[-1])
				let	l:lines = l:lines . printf("$readmemb(\"./vec/%s.vec\",%sv%s);\r" , l:portName, l:tabStr, l:portName)
			else
				let	l:lines = l:lines . printf("$readmemb(\"./vec/%s.vec\",%sv%s);\rend\r\r" , l:portName, l:tabStr, l:portName)
			endif
		endfor

		" Task
		let	l:lines = l:lines . printf("\b")
		let	l:lines = l:lines . printf("// --------------------------------------------------\r")
		let	l:lines = l:lines . printf("//	Tasks\r")
		let	l:lines = l:lines . printf("// --------------------------------------------------\r\t")
		let	l:lines = l:lines . printf("reg		[4*32-1:0]	taskState;\r")
		let	l:lines = l:lines . printf("integer				err	= 0;\r\r")

		" Task: Init
		let	l:lines = l:lines . printf("task init;\r")
		let	l:lines = l:lines . printf("begin\r")
		let	l:lines = l:lines . printf("taskState		= \"Init\";\r")
		for	l:aLine in l:portLineList
			if(matchstr(l:aLine, "input") != "")
				let l:portName	= split(l:aLine)[-1]
				let	l:portName	= substitute(l:portName, ',', '', '')
				let	l:tabNum	= len(l:portName)/4.0
				let	l:tabStr	= repeat("\t", float2nr(ceil(l:maxTapNum - l:tabNum)))
				let	l:lines = l:lines . printf("%s%s= 0;\r", l:portName, l:tabStr)
			endif
		endfor
		let	l:lines = l:lines . printf("end\r")
		let	l:lines = l:lines . printf("endtask\r\r")

		" Task: Reset
		for	l:portName in l:portList
			if(matchstr(l:portName, "rst") != "") 
				let	l:lines = l:lines . printf("task resetNCycle;\r")
				let	l:lines = l:lines . printf("input	[9:0]	i;\r")
				let	l:lines = l:lines . printf("begin\r")
				let	l:lines = l:lines . printf("taskState		= \"Reset\";\r")
				let	l:lines = l:lines . printf("%s	= 1'b0;\r", l:portName)
				let	l:lines = l:lines . printf("#(i*1000/`CLKFREQ);\r")
				let	l:lines = l:lines . printf("%s	= 1'b1;\r", l:portName)
				let	l:lines = l:lines . printf("end\r")
				let	l:lines = l:lines . printf("endtask\r\r")
			endif
		endfor

		" Task: vecInsert
		let	l:lines = l:lines . printf("task vecInsert;\r")
		let	l:lines = l:lines . printf("input	[$clog2(`NVEC)-1:0]	i;\r")
		let	l:lines = l:lines . printf("begin\r")
		let	l:lines = l:lines . printf("$sformat(taskState,	\"VEC[%%3d]\", i);\r")
		for	l:aLine in l:portLineList
			if(matchstr(l:aLine, "input") != "")
				let l:portName	= split(l:aLine)[-1]
				let	l:portName	= substitute(l:portName, ',', '', '')
				let	l:tabNum	= len(l:portName)/4.0
				let	l:tabStr	= repeat("\t", float2nr(ceil(l:maxTapNum - l:tabNum)))
				let	l:lines = l:lines . printf("%s%s= v%s[i];\r", l:portName, l:tabStr, l:portName)
			endif
		endfor
		let	l:lines = l:lines . printf("end\r")
		let	l:lines = l:lines . printf("endtask\r\r")

		" Task: vecVerify
		let	l:lines = l:lines . printf("task vecVerify;\r")
		let	l:lines = l:lines . printf("input	[$clog2(`NVEC)-1:0]	i;\r")
		let	l:lines = l:lines . printf("begin\r")
		let	l:lines = l:lines . printf("#(0.1*1000/`CLKFREQ);\r")
		let	l:oVectorMatchList	= []
		" let	l:portList	= add(l:portList, l:portName)
		for	l:aLine in l:portLineList
			if(matchstr(l:aLine, "output") != "")
				let l:portName	= split(l:aLine)[-1]
				let	l:portName	= substitute(l:portName, ',', '', '')
				let	l:tabNum	= len(l:portName)/4.0
				let	l:tabStr	= repeat("\t", float2nr(ceil(l:maxTapNum - l:tabNum - 1)))
				let	l:lines 	= l:lines . printf("if (%s%s!= v%s[i]) begin $display(\"[Idx: %%3d] Mismatched %s\", i); end\r", l:portName, l:tabStr, l:portName, l:portName)
				let	l:oVectorMatchList = add(l:oVectorMatchList, printf("(%s != v%s[i])", l:portName, l:portName))
			endif
		endfor

		let	l:lines = l:lines . printf("if (")
		for l:oVectorMatch in l:oVectorMatchList
			if (l:oVectorMatch != l:oVectorMatchList[-1])
				let	l:lines = l:lines . printf("%s || ", l:oVectorMatch)
			else
				let	l:lines = l:lines . printf("%s) begin err++; end\r", l:oVectorMatch)
			endif
		endfor
		let	l:lines = l:lines . printf("#(0.9*1000/`CLKFREQ);\r")
		let	l:lines = l:lines . printf("end\r")
		let	l:lines = l:lines . printf("endtask\r\r")

	endif

	exe	printf(":.normal i%s", l:lines)

endfunction
