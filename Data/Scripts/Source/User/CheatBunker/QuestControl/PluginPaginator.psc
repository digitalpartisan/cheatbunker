Scriptname CheatBunker:QuestControl:PluginPaginator extends dynamicterminal:paginator Conditional

CheatBunker:QuestControl:DigitalInput:Terminal terminalLogic = None

Function setTerminalLogic(CheatBunker:QuestControl:DigitalInput:Terminal newValue)
	terminalLogic = newValue
EndFunction

Function itemActivation(Int iItem, ObjectReference akTerminalRef)
	terminalLogic && terminalLogic.setPlugin( getItem(iItem) as InjectTec:Plugin , akTerminalRef )
EndFunction
