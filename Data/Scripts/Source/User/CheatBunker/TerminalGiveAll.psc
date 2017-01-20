Scriptname CheatBunker:TerminalGiveAll extends CheatBunker:TerminalGiveItem Conditional

Function giveAll()
	Actor aPlayer = Game.GetPlayer()
	DynamicTerminal:ListWrapper data = getData()
	Int iSize = data.getSize()
	Int iCounter = 0
	While (iCounter < iSize)
		Form fItem = data.getItem(iCounter)
		aPlayer.addItem(fItem, iAmountToGive)
		iCounter += 1
	EndWhile
EndFunction
