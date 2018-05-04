Scriptname CheatBunker:QuestControl:PluginPaginator extends dynamicterminal:paginator Conditional

CheatBunker:QuestControl Property CheatBunkerQuestControl Auto Const Mandatory

Function itemActivation(Int iItem, ObjectReference akTerminalRef)
	CheatbunkerQuestControl.setPlugin( getItem(iItem) as InjectTec:Plugin , akTerminalRef)
EndFunction
