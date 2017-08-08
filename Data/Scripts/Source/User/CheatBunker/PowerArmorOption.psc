Scriptname CheatBunker:PowerArmorOption extends CheatBunker:PowerArmorOption:Abstract

Furniture Property Frame Auto Const

Group Parts
	Armor Property Helmet Auto Const
	Armor Property Torso Auto Const
	Armor Property ArmLeft Auto Const
	Armor Property ArmRight Auto Const
	Armor Property LegLeft Auto Const
	Armor Property LegRight Auto Const
EndGroup

Group PartLevels
	ObjectMod Property HelmetLining Auto Const
	ObjectMod Property TorsoLining Auto Const
	ObjectMod Property ArmLining Auto Const
	ObjectMod Property LegLining Auto Const
EndGroup

Furniture Function getCustomFrame()
{Existing PA options had this set.  Removing properties or changing their values is not feasible at the time of writing the Remote Loading features, so the Frame property stays around on this script.}
	if (None != Frame)
		return Frame
	else
		return None
	endif
EndFunction

Armor Function getHelmet()
	return Helmet
EndFunction

Armor Function getTorso()
	return Torso
EndFunction

Armor Function getArmLeft()
	return ArmLeft
EndFunction

Armor Function getArmRight()
	return ArmRight
EndFunction

Armor Function getLegLeft()
	return LegLeft
EndFunction

Armor Function getLegRight()
	return LegRight
EndFunction

ObjectMod Function getHelmetLining()
	return HelmetLining
EndFunction

ObjectMod Function getTorsoLining()
	return TorsoLining
EndFunction

ObjectMod Function getArmLining()
	return ArmLining
EndFunction

ObjectMod Function getLegLining()
	return LegLining
EndFunction
