Scriptname CheatBunker:Importer:Container extends ObjectReference

FormList Property MyContents Auto Const Mandatory

FormList Function getContents()
    return MyContents
EndFunction

Function addContents()
    FormList contents = getContents()
    if (!contents || !contents.GetSize())
        return
    endif

    Int iCounter = 0
    Int iSize = contents.GetSize()
	CheatBunker:Importer:Item item = None
    while (iCounter < iSize)
		item = contents.GetAt(iCounter) as CheatBunker:Importer:Item
		item && item.addToContainer(self)
        iCounter += 1
    endWhile
EndFunction

Event OnClose(ObjectReference akActionRef)
	CheatBunker:Logger.containerReset(self)
	Reset()
	addContents()
EndEvent
