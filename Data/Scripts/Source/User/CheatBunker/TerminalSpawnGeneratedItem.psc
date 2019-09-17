Scriptname CheatBunker:TerminalSpawnGeneratedItem extends DynamicTerminal:Paginator Conditional

Function itemActivation(Int iItem, ObjectReference akTerminalRef)
	CheatBunker:Dependencies:Spawning spawningDependencies = CheatBunker:Dependencies:Spawning.getInstance()
	if ( (getItem(iItem) as CheatBunker:ItemGenerator:Abstract).generate( spawningDependencies.getContainerReference() ) )
		spawningDependencies.showGenericSuccessMessage()
	endif
EndFunction
