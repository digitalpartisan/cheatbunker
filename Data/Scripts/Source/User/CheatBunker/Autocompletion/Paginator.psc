Scriptname CheatBunker:Autocompletion:Paginator extends DynamicTerminal:Paginator Conditional

CheatBunker:Autocompletion:Proxy Property AutocompletionProxy Auto Const

Function itemActivation(Int iItem, ObjectReference akTerminalRef)
	AutocompletionProxy.setAutocompletion(getItem(iItem) as CheatBunker:Autocompletion)
	AutocompletionProxy.draw(akTerminalRef)
EndFunction

