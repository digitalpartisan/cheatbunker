Scriptname CheatBunker:Importer:Container extends ObjectReference Hidden

FormList Property MyContents Auto Const Mandatory

FormList Function getContents()
    return MyContents
EndFunction

Function importItem(Form itemToAdd)
    {Override this to implement a particular type of importer container.}
EndFunction

Function addContents()
    FormList contents = getContents()
    if (!contents || !contents.GetSize())
        return
    endif

    Int iCounter = 0
    Int iSize = contents.GetSize()
    while (iCounter < iSize)
        importItem(contents.GetAt(iCounter))
        iCounter += 1
    endWhile
EndFunction

Event OnClose(ObjectReference akActionRef)
    RemoveAllItems()
	Reset()
	addContents()
EndEvent
