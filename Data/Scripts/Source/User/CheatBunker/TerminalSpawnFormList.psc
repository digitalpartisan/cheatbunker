Scriptname CheatBunker:TerminalSpawnFormList extends DynamicTerminal:Paginator Conditional

Function itemActivation(Int iItem, ObjectReference akTerminalRef)
	(getItem(iItem) as CheatBunker:SpawnFormList).spawn()
EndFunction
