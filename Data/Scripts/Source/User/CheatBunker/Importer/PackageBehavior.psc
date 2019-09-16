Scriptname CheatBunker:Importer:PackageBehavior extends chronicle:package:custombehavior

FormList Property MyImporters Auto Const Mandatory

FormList Function getImporters()
	return MyImporters
EndFunction

Bool Function installBehavior()
	CheatBunker:Importer.injectList(getImporters())
	return true
EndFunction

Bool Function postloadBehavior()
	CheatBunker:Importer.injectList(getImporters())
	return true
EndFunction

Bool Function uninstallBehavior()
	CheatBunker:Importer.revertList(getImporters())
	return true
EndFunction
