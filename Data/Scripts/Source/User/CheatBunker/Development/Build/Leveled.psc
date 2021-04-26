Scriptname CheatBunker:Development:Build:Leveled extends CheatBunker:Development:Build

CheatBunker:Development:Utility:Step[] Property Steps Auto Const Mandatory
CheatBunker:Development:Utility:StartingStats Property StartingStats Auto Const Mandatory
CheatBunker:Development:Utility:BobbleheadRequirements Property Bobbleheads Auto Const
CheatBunker:Development:Utility:Step[] function getSteps()
	return Steps
endfunction

function apply()
	CheatBunker:Development:Utility:Step[] mySteps = getSteps()
	if (!mySteps || !mySteps.length)
		return
	endif

	CheatBunker:Development:Utility buildUtility = CheatBunker:Dependencies:General.getInstance().getDevelopmentUtility()
	buildUtility.enforceStartingStats(StartingStats, Bobbleheads)

	Int iCounter = 0
	while (iCounter < mySteps.length)
		buildUtility.enforceStep(mySteps[iCounter])
		iCounter += 1
	endwhile
endfunction
