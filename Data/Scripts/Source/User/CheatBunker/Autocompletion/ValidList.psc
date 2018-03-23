Scriptname CheatBunker:Autocompletion:ValidList extends DynamicTerminal:ListWrapper:DynamicList

Bool Function itemPassesFilter(Int iNumber)
	return (getItem(iNumber) as CheatBunker:Autocompletion).isValid()
EndFunction
