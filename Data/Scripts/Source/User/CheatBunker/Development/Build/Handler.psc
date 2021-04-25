Scriptname CheatBunker:Development:Build:Handler extends DynamicTerminal:Basic Conditional

Bool bIsValid = false Conditional
Bool bIsWorking = false Conditional
CheatBunker:Development:Build myBuild = None

Bool function isValid()
	return bIsValid
endfunction

bool function isWorking()
	return bIsWorking
endfunction

CheatBunker:Development:Build function getBuild()
	return myBuild
endfunction

function setBuild(CheatBunker:Development:Build newValue)
	myBuild = newValue
	checkState()
endfunction

function checkState()
	bIsValid = (None != myBuild)
	bIsWorking = CheatBunker:Dependencies:General.getInstance().getDevelopmentUtility().isWorking()
endfunction

function tokenReplacementLogic()
	checkState()

	if (!isValid())
		return
	endif
	
	CheatBunker:Development:Build build = getBuild()
	replace("BuildObject", build)
	replace("BuildExplanation", build.getExplanation())
	replace("BuildAuthor", build.getAuthor())
endfunction

function apply(ObjectReference akTerminalRef)
	isValid() && !isWorking() && CheatBunker:Dependencies:General.getInstance().getDevelopmentUtility().apply(getBuild()) && draw(akTerminalRef)
endfunction
