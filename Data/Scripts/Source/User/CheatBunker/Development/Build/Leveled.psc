Scriptname CheatBunker:Development:Build:Leveled extends CheatBunker:Development:Build

CheatBunker:Development:Utility:Step[] Property Steps Auto Const Mandatory
CheatBunker:Development:Utility:StartingStats Property StartingStats Auto Const Mandatory
CheatBunker:Development:Utility:Step[] function getSteps()
	return Steps
endfunction

function apply(int progressionPercentage = 100)
	CheatBunker:Development:Utility:Step[] mySteps = getSteps()
	if (!mySteps || !mySteps.length)
		return
	endif

	CheatBunker:Development:Utility buildUtility = CheatBunker:Dependencies:General.getInstance().getDevelopmentUtility()
	buildUtility.enforceStartingStats(StartingStats)

	Int iCounter = 0
	Int iTargetLevel = getTargetLevel(progressionPercentage)
	while (iCounter < mySteps.length && iCounter < iTargetLevel)
		buildUtility.enforceStep(mySteps[iCounter])
		iCounter += 1
	endwhile
endfunction

bool function hasProgressionOptions()
	return true
endfunction

int function getLevelCount()
	CheatBunker:Development:Utility:Step[] mySteps = getSteps()

	if (!mySteps)
		return 0
	endif

	return mySteps.length
endfunction
