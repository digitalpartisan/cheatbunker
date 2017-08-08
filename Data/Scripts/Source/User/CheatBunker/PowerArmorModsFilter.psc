Scriptname CheatBunker:PowerArmorModsFilter extends DynamicTerminal:ListWrapper:FormList

Bool Function itemPassesFilter(Int iItem)
	return (getItem(iItem) as CheatBunker:PowerArmorOption:Abstract).HasMods
EndFunction
