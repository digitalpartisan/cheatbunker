Scriptname CheatBunker:ImportersPagination extends DynamicTerminal:Paginator Conditional

CheatBunker:ImporterDiagnostics Property ImporterDiagnostics Auto Const

Function itemActivation(Int iItem, ObjectReference akTerminalRef)
	ImporterDiagnostics.setImporter(getItem(iItem) as CheatBunker:Importer)
	ImporterDiagnostics.draw(akTerminalRef)
EndFunction
