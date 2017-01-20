Scriptname CheatBunker:TerminalGiveItemAmount extends DynamicTerminal:Paginator Conditional

Function itemActivation(Int iItem, ObjectReference akTerminalRef)
	CheatBunker:ItemQuantity itemData = getItem(iItem) as CheatBunker:ItemQuantity
	Game.GetPlayer().AddItem(itemData.fItem, itemData.iAmount)
EndFunction

Function tokenReplacementLogic()
	Int iCounter = 0
	Int iPageItems = getPageItems()
	while (iCounter < iPageItems)
		CheatBunker:ItemQuantity itemData = getItem(iCounter) as CheatBunker:ItemQuantity
		replace("Item" + iCounter, itemData.fItem)
		iCounter += 1
	endwhile
EndFunction
