Scriptname CheatBunker:Importer:PackageBehavior extends Chronicle:Package:CustomBehavior

FormList Property MyImporters Auto Const Mandatory

FormList Function getImporters()
	return MyImporters
EndFunction

Bool Function uninstallBehavior()
	CheatBunker:Importer.backOutList(getImporters())
	return true
EndFunction
