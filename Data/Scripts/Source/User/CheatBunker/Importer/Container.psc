Scriptname CheatBunker:Importer:Container extends ObjectReference

FormList Property MyItems Auto Const Mandatory

Event OnClose(ObjectReference akActionRef)
	Reset()
	
	if (!MyItems || !MyItems.GetSize())
		return
	endif
	
	Int iCounter = 0
	Int iSize = MyItems.GetSize()
	CheatBunker:Importer:Items currentItem = None
	while (iCounter < iSize)
		currentItem = MyItems.GetAt(iCounter) as CheatBunker:Importer:Items
		if (currentItem)
			currentItem.addToContainer(self)
		endif
		
		iCounter += 1
	endWhile
EndEvent
