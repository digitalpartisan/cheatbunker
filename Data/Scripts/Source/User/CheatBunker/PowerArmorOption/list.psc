Scriptname CheatBunker:PowerArmorOption:list extends DynamicTerminal:ListWrapper:FormList:STATIC

Function clean()
	parent.clean()
	
	FormList options = getRawData()
	if (!options || !options.GetSize())
		return
	endif
	
	Int iCounter = 0
	Int iSize = options.GetSize()
	CheatBunker:PowerArmorOption:Abstract option = None
	while (iCounter < iSize)
		option = options.GetAt(iCounter) as CheatBunker:PowerArmorOption:Abstract
		option && option.clean()
		iCounter += 1
	endWhile
EndFunction
