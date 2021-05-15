Scriptname CheatBunker:Development:Build:Handler extends DynamicTerminal:Basic Conditional

Bool bIsValid = false Conditional
Bool bIsWorking = false Conditional
bool bHasProgressionOptions = false Conditional
bool bHasDetails = false Conditional
CheatBunker:Development:Build myBuild = None

Bool function isValid()
	return bIsValid
endfunction

bool function isWorking()
	return bIsWorking
endfunction

bool function hasDetails()
	return bHasDetails
endfunction

CheatBunker:Development:Build function getBuild()
	return myBuild
endfunction

function setBuild(CheatBunker:Development:Build newValue)
	myBuild = newValue
	checkState()
endfunction

function checkState()
	bHasProgressionOptions = false
	bHasDetails = false

	bIsValid = (None != myBuild)
	bIsWorking = CheatBunker:Dependencies:General.getInstance().getDevelopmentUtility().isWorking()
	if (isValid())
		CheatBunker:Development:Build build = getBuild()
		bHasProgressionOptions = build.hasProgressionOptions()
		bHasDetails = build.hasDetails()
	endif
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
	replace("BuildDisplayLevels", build.getDisplayLevels())
	replace("BuildDetails", build.getDetails())
endfunction

function apply(ObjectReference akTerminalRef, int progressionPercentage = 100)
	isValid() && !isWorking() && CheatBunker:Dependencies:General.getInstance().getDevelopmentUtility().apply(getBuild(), progressionPercentage) && draw(akTerminalRef)
endfunction
