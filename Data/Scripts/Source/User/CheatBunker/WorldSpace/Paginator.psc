Scriptname CheatBunker:WorldSpace:Paginator extends DynamicTerminal:Paginator Conditional

CheatBunker:WorldSpace:Handler Property CheatBunkerWorldSpaceHandler Auto Const Mandatory

Function itemActivation(Int iItem, ObjectReference akTerminalRef)
    CheatBunkerWorldSpaceHandler.setWorldSpace(getItem(iItem) as CheatBunker:WorldSpace)
    CheatBunkerWorldSpaceHandler.draw(akTerminalRef)
EndFunction
