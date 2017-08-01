Scriptname CheatBunker:ItemGenerator extends CheatBunker:ItemGenerator:Abstract

Form Property fItem Auto Const Mandatory
ObjectMod[] Property Mods Auto Const

Form Function getForm()
{Override in child scripts according to how the data is accessed.}
	return fItem
EndFunction

ObjectMod[] Function getMods()
{Override in child scripts according to how the data is accessed.}
	return Mods
EndFunction
