Scriptname CheatBunker:PackagesPaginator extends dynamicterminal:paginator Conditional

CheatBunker:PackageDiagnostics Property PackageDiagnostics Auto Const

Function itemActivation(Int iItem, ObjectReference akTerminalRef)
	PackageDiagnostics.setPackage(getItem(iItem) as CheatBunker:Package)
	PackageDiagnostics.draw(akTerminalRef)
EndFunction
