Scriptname CheatBunker:QuestControl:PluginList extends DynamicTerminal:ListWrapper:FormList

Bool Function itemPassesFilter(Int iNumber)
	return (getItem(iNumber) as InjectTec:Plugin).isInstalled()
EndFunction
