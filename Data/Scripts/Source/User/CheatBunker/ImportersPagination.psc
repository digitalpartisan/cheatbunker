Scriptname CheatBunker:ImportersPagination extends DynamicTerminal:Paginator Conditional

CheatBunker:ImporterDiagnostics Property ImporterDiagnostics Auto Const

Function tokenReplacementLogic()
{This is overriden here because the Importer pagination occurs on a terminal accessed through another paginator.  Backwards navigation throug the terminals leaves artifacts on the Package pagination terminal without doing this to change the name of replacement fields.}
	Int iCounter = 0
	Int iPageItemValue = getPageItems() ; darn that variable privacy mess
	while (iCounter < iPageItemValue)
		replace("Importer" + iCounter, getItem(iCounter))
		iCounter += 1
	endwhile
EndFunction

Function itemActivation(Int iItem, ObjectReference akTerminalRef)
	ImporterDiagnostics.setImporter(getItem(iItem) as CheatBunker:Importer)
	ImporterDiagnostics.draw(akTerminalRef)
EndFunction
