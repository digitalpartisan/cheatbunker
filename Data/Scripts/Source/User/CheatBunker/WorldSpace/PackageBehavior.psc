Scriptname CheatBunker:WorldSpace:PackageBehavior extends Chronicle:Package:CustomBehavior

CheatBunker:WorldSpace[] Property WorldSpaces = None Auto Const Mandatory

CheatBunker:WorldSpace[] Function getWorldSpaces()
    return WorldSpaces
EndFunction

Bool Function installBehavior()
	CheatBunker:WorldSpace.startBulk(getWorldSpaces())
	return true
EndFunction

Bool Function postloadBehavior()
	CheatBunker:WorldSpace.startBulk(getWorldSpaces())
	return true
EndFunction

Bool Function uninstallBehavior()
	CheatBunker:WorldSpace.stopBulk(getWorldSpaces())
	return true
EndFunction
