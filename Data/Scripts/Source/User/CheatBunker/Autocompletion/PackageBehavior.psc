Scriptname CheatBunker:Autocompletion:PackageBehavior extends Chronicle:Package:CustomBehavior

FormList Property MyAutocompletions Auto Const Mandatory

FormList Function getAutocompletions()
	return MyAutocompletions
EndFunction

Bool Function installBehavior()
	CheatBunker:Autocompletion.initializeList(getAutocompletions())
	return true
EndFunction

Bool Function postloadBehavior()
	CheatBunker:Autocompletion.initializeList(getAutocompletions())
	return true
EndFunction

Bool Function uninstallBehavior()
	CheatBunker:Autocompletion.terminateList(getAutocompletions())
	return true
EndFunction
