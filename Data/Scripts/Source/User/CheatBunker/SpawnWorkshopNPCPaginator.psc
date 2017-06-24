Scriptname CheatBunker:SpawnWorkshopNPCPaginator extends dynamicterminal:paginator Conditional

Function itemActivation(Int iItem, ObjectReference akTerminalRef)
	(getItem(iItem) as CheatBunker:WorkshopNPCLogic).run()
EndFunction
