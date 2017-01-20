Scriptname CheatBunker:TerminalGiveItem extends DynamicTerminal:Paginator Conditional

Int Property iAmountToGive = 1 Auto Const

Function itemActivation(Int iItem, ObjectReference akTerminalRef)
	Game.GetPlayer().AddItem(getItem(iItem), iAmountToGive)
EndFunction
