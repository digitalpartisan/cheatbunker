Scriptname CheatBunker:PowerArmorOption:Imported extends CheatBunker:PowerArmorOption:Abstract

CheatBunker:Importer:Item:PowerArmor Property MySource Auto Const Mandatory

CheatBunker:Importer:Item:PowerArmor Function getSource()
	return MySource
EndFunction

Bool Function canLoad()
	return getSource().hasLoaded()
EndFunction

Armor Function getHelmet()
	return getSource().getHelmet()
EndFunction

Armor Function getTorso()
	return getSource().getTorso()
EndFunction

Armor Function getArmLeft()
	return getSource().getArmLeft()
EndFunction

Armor Function getArmRight()
	return getSource().getArmRight()
EndFunction

Armor Function getLegLeft()
	return getSource().getLegLeft()
EndFunction

Armor Function getLegRight()
	return getSource().getLegRight()
EndFunction

ObjectMod Function getHelmetLining()
	return getSource().getHelmetLining()
EndFunction

ObjectMod Function getTorsoLining()
	return getSource().getTorsoLining()
EndFunction

ObjectMod Function getArmLining()
	return getSource().getArmLining()
EndFunction

ObjectMod Function getLegLining()
	return getSource().getLegLining()
EndFunction
