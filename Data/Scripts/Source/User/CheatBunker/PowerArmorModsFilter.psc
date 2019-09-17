Scriptname CheatBunker:PowerArmorModsFilter extends DynamicTerminal:ListWrapper:FormList:Static

Bool Function itemPassesFilter(Int iItem)
	return (getItem(iItem) as CheatBunker:PowerArmorOption:Abstract).hasMods()
EndFunction
