Scriptname CheatBunker:Importer:Paginator extends DynamicTerminal:Paginator Conditional

CheatBunker:Importer:Diagnostics Property ImporterDiagnostics Auto Const

Function itemActivation(Int iItem, ObjectReference akTerminalRef)
	ImporterDiagnostics.setImporter(getItem(iItem) as CheatBunker:Importer)
	ImporterDiagnostics.draw(akTerminalRef)
EndFunction
