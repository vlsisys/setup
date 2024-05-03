# Auto added signals
set iList	[list]
set oList	[list]
set nfacs	[ gtkwave::getNumFacs ]
set maxLev	[ gtkwave::getHierMaxLevel ]

# Auto added signals
for {set i 0} {$i < $nfacs } {incr i} {
    set sigName	[ gtkwave::getFacName $i ]
	set sigType	[ gtkwave::getFacVtype $i ]
	set sigDype	[ gtkwave::getFacDtype $i ]
	if { [ llength [ split $sigName . ] ] == 2 } {
		if { $sigType == "wire"} {
	    	lappend oList	"$sigName"
		} else {
	    	lappend iList	"$sigName"
		}
	}
}

foreach	aSig $iList {
	if { [lindex [split $aSig .] 1] != "vcd_file\[255:0\]" } {
		gtkwave::addSignalsFromList $aSig
	}
}
foreach	aSig $oList {
	gtkwave::addSignalsFromList $aSig
}

# Ditch all signals
gtkwave::/Time/Zoom/Zoom_Best_Fit
gtkwave::setLeftJustifySigs on

#set max_level [ gtkwave::getHierMaxLevel ]
#puts "$max_level"

