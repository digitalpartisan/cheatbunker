Scriptname CheatBunker:CompanionPaginator extends DynamicTerminal:Paginator Conditional

CheatBunker:CompanionDetails Property CheatBunkerCompanionDetails Auto Const

Function itemActivation(Int iItem, ObjectReference akTerminalRef)
	CheatBunkerCompanionDetails.setCompanion(getItem(iItem) as CheatBunker:Companion)
	CheatBunkerCompanionDetails.draw(akTerminalRef)
EndFunction

Function tokenReplacementLogic()
	Int iCounter = 0
	Int iSize = getPageItems()
	while (iCounter < iSize)
		replace("Item" + iCounter, (getItem(iCounter) as CheatBunker:Companion).abCompanion)
		iCounter += 1
	endwhile
EndFunction
