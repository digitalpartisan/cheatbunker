Scriptname CheatBunker:TerminalGiveItemAmount extends DynamicTerminal:Paginator Conditional

Function itemActivation(Int iItem, ObjectReference akTerminalRef)
	(getItem(iItem) as CheatBunker:ItemQuantity:Abstract).give()
EndFunction

Function tokenReplacementLogic()
	Int iCounter = 0
	Int iPageItems = getPageItems()
	while (iCounter < iPageItems)
		CheatBunker:ItemQuantity:Abstract itemData = getItem(iCounter) as CheatBunker:ItemQuantity:Abstract
		replace("Item" + iCounter, itemData.getDisplayForm())
		iCounter += 1
	endwhile
EndFunction
