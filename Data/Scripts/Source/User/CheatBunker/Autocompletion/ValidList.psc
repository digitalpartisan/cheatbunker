Scriptname CheatBunker:Autocompletion:ValidList extends DynamicTerminal:ListWrapper:FormList:Dynamic

Bool Function itemPassesFilter(Int iNumber)
	return (getItem(iNumber) as CheatBunker:Autocompletion).isValid()
EndFunction
