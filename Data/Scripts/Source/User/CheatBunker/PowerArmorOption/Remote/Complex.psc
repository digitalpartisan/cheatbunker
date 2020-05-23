Scriptname CheatBunker:PowerArmorOption:Remote:Complex extends CheatBunker:PowerArmorOption:Remote
{This armor loader is intended to handle complicated cases where a third-party plugin provides less than a whole set and pieces from the base game must be substituted to complete the set.}

Import InjectTec:Utility:HexidecimalLogic

Group HelmetSettings
	Armor Property Helmet Auto Const
	DigitSet Property HelmetDigits Auto Const
EndGroup

Group TorsoSettings
	Armor Property Torso Auto Const
	DigitSet Property TorsoDigits Auto Const
EndGroup

Group ArmLeftSettings
	Armor Property ArmLeft Auto Const
	DigitSet Property ArmLeftDigits Auto Const
EndGroup

Group ArmRightSettings
	Armor Property ArmRight Auto Const
	DigitSet Property ArmRightDigits Auto Const
EndGroup

Group LegLeftSettings
	Armor Property LegLeft Auto Const
	DigitSet Property LegLeftDigits Auto Const
EndGroup

Group LegRightSettings
	Armor Property LegRight Auto Const
	DigitSet Property LegRightDigits Auto Const
EndGroup

Group HelmetLiningSettings
	ObjectMod Property HelmetLining Auto Const
	DigitSet Property HelmetLiningDigits Auto Const
EndGroup

Group TorsoLiningSettings
	ObjectMod Property TorsoLining Auto Const
	DigitSet Property TorsoLiningDigits Auto Const
EndGroup

Group ArmLiningSettings
	ObjectMod Property ArmLining Auto Const
	DigitSet Property ArmLiningDigits Auto Const
EndGroup

Group LegLiningSettings
	ObjectMod Property LegLining = None Auto Const
	DigitSet Property LegLiningDigits Auto Const
EndGroup

Armor Function loadArmor(Armor LocalArmor, DigitSet RemoteDigits)
	return InjectTec:Utility:Form.load(LocalArmor, PluginToReference, RemoteDigits) as Armor
EndFunction

ObjectMod Function loadLining(ObjectMod LocalLining, DigitSet RemoteDigits)
	return InjectTec:Utility:Form.load(LocalLining, PluginToReference, RemoteDigits) as ObjectMod
EndFunction

Function loadHelmet()
	setHelmet(loadArmor(Helmet, HelmetDigits))
EndFunction

Function loadTorso()
	setTorso(loadArmor(Torso, TorsoDigits))
EndFunction

Function loadArmLeft()
	setArmLeft(loadArmor(ArmLeft, ArmLeftDigits))
EndFunction

Function loadArmRight()
	setArmRight(loadArmor(ArmRight, ArmRightDigits))
EndFunction

Function loadLegLeft()
	setLegLeft(loadArmor(LegLeft, LegLeftDigits))
EndFunction

Function loadLegRight()
	setLegRight(loadArmor(LegRight, LegRightDigits))
EndFunction

Function loadHelmetLining()
	setHelmetLining(loadLining(HelmetLining, HelmetLiningDigits))
EndFunction

Function loadTorsoLining()
	setTorsoLining(loadLining(TorsoLining, TorsoLiningDigits))
EndFunction

Function loadArmLining()
	setArmLining(loadLining(ArmLining, ArmLiningDigits))
EndFunction

Function loadLegLining()
	setLegLining(loadLining(LegLining, LegLiningDigits))
EndFunction
