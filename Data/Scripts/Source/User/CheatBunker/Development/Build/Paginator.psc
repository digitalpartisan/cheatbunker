Scriptname CheatBunker:Development:Build:Paginator extends DynamicTerminal:Paginator Conditional

CheatBunker:Development:Build:Handler Property CheatBunkerDevelopmentBuildHandler Auto Const

Function itemActivation(Int iItem, ObjectReference akTerminalRef)
	CheatBunkerDevelopmentBuildHandler.setBuild(getItem(iItem) as CheatBunker:Development:Build)
	CheatBunkerDevelopmentBuildHandler.draw(akTerminalRef)
EndFunction
