Scriptname CheatBunker:PowerArmorOption:Remote:Complex extends CheatBunker:PowerArmorOption:Remote
{This armor loader is intended to handle complicated cases where a third-party plugin provides less than a whole set and pieces from the base game must be substituted to complete the set.}

Import InjectTec:Utility:HexidecimalLogic

Group HelmetSettings
	Armor Property Helmet Auto Const
	Int Property HelmetID = 0 Auto Const
	DigitSet Property HelmetDigits Auto Const
EndGroup

Group TorsoSettings
	Armor Property Torso Auto Const
	Int Property TorsoID = 0 Auto Const
	DigitSet Property TorsoDigits Auto Const
EndGroup

Group ArmLeftSettings
	Armor Property ArmLeft Auto Const
	Int Property ArmLeftID = 0 Auto Const
	DigitSet Property ArmLeftDigits Auto Const
EndGroup

Group ArmRightSettings
	Armor Property ArmRight Auto Const
	Int Property ArmRightID = 0 Auto Const
	DigitSet Property ArmRightDigits Auto Const
EndGroup

Group LegLeftSettings
	Armor Property LegLeft Auto Const
	Int Property LegLeftID = 0 Auto Const
	DigitSet Property LegLeftDigits Auto Const
EndGroup

Group LegRightSettings
	Armor Property LegRight Auto Const
	Int Property LegRightID = 0 Auto Const
	DigitSet Property LegRightDigits Auto Const
EndGroup

Group HelmetLiningSettings
	ObjectMod Property HelmetLining Auto Const
	Int Property HelmetLiningID = 0 Auto Const
	DigitSet Property HelmetLiningDigits Auto Const
EndGroup

Group TorsoLiningSettings
	ObjectMod Property TorsoLining Auto Const
	Int Property TorsoLiningID = 0 Auto Const
	DigitSet Property TorsoLiningDigits Auto Const
EndGroup

Group ArmLiningSettings
	ObjectMod Property ArmLining Auto Const
	Int Property ArmLiningID = 0 Auto Const
	DigitSet Property ArmLiningDigits Auto Const
EndGroup

Group LegLiningSettings
	ObjectMod Property LegLining = None Auto Const
	Int Property LegliningID = 0 Auto Const
	DigitSet Property LegLiningDigits Auto Const
EndGroup

Armor Function loadArmor(Armor LocalArmor, Int RemoteID, DigitSet RemoteDigits)
	return InjectTec:Utility:Form.load(LocalArmor, PluginToReference, RemoteID, RemoteDigits) as Armor
EndFunction

ObjectMod Function loadLining(ObjectMod LocalLining, Int RemoteID, DigitSet RemoteDigits)
	return InjectTec:Utility:Form.load(LocalLining, PluginToReference, RemoteID, RemoteDigits) as ObjectMod
EndFunction

Function loadHelmet()
	setHelmet(loadArmor(Helmet, HelmetID, HelmetDigits))
EndFunction

Function loadTorso()
	setTorso(loadArmor(Torso, TorsoID, TorsoDigits))
EndFunction

Function loadArmLeft()
	setArmLeft(loadArmor(ArmLeft, ArmLeftID, ArmLeftDigits))
EndFunction

Function loadArmRight()
	setArmRight(loadArmor(ArmRight, ArmRightID, ArmRightDigits))
EndFunction

Function loadLegLeft()
	setLegLeft(loadArmor(LegLeft, LegLeftID, LegLeftDigits))
EndFunction

Function loadLegRight()
	setLegRight(loadArmor(LegRight, LegRightID, LegRightDigits))
EndFunction

Function loadHelmetLining()
	setHelmetLining(loadLining(HelmetLining, HelmetLiningID, HelmetLiningDigits))
EndFunction

Function loadTorsoLining()
	setTorsoLining(loadLining(TorsoLining, TorsoLiningID, TorsoLiningDigits))
EndFunction

Function loadArmLining()
	setArmLining(loadLining(ArmLining, ArmLiningID, ArmLiningDigits))
EndFunction

Function loadLegLining()
	setLegLining(loadLining(LegLining, LegLiningID, LegLiningDigits))
EndFunction
