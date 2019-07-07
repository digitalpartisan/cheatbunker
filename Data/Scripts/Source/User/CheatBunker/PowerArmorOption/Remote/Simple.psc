Scriptname CheatBunker:PowerArmorOption:Remote:Simple extends CheatBunker:PowerArmorOption:Remote

Import InjectTec:Utility:HexidecimalLogic

Group PartIDs
	Int Property HelmetID = 0 Auto Const
	DigitSet Property HelmetDigits Auto Const
	Int Property TorsoID = 0 Auto Const
	DigitSet Property TorsoDigits Auto Const
	Int Property ArmLeftID = 0 Auto Const
	DigitSet Property ArmLeftDigits Auto Const
	Int Property ArmRightID = 0 Auto Const
	DigitSet Property ArmRightDigits Auto Const
	Int Property LegLeftID = 0 Auto Const
	DigitSet Property LegLeftDigits Auto Const
	Int Property LegRightID = 0 Auto Const
	DigitSet Property LegRightDigits Auto Const
EndGroup

Group LiningIDs
	Int Property HelmetLiningID = 0 Auto Const
	DigitSet Property HelmetLiningDigits Auto Const
	Int Property TorsoLiningID = 0 Auto Const
	DigitSet Property TorsoLiningDigits Auto Const
	Int Property ArmLiningID = 0 Auto Const
	DigitSet Property ArmLiningDigits Auto Const
	Int Property LegLiningID = 0 Auto Const
	DigitSet Property LegLiningDigits Auto Const
EndGroup

Armor Function loadArmor(Int RemoteID, DigitSet RemoteDigits)
	return PluginToReference.lookupWithCoalescedID(RemoteID, RemoteDigits) as Armor
EndFunction

ObjectMod Function loadLining(Int RemoteID, DigitSet RemoteDigits)
	return PluginToReference.lookupWithCoalescedID(RemoteID, RemoteDigits) as ObjectMod
EndFunction

Function loadHelmet()
	setHelmet(loadArmor(HelmetID, HelmetDigits))
EndFunction

Function loadTorso()
	setTorso(loadArmor(TorsoID, TorsoDigits))
EndFunction

Function loadArmLeft()
	setArmLeft(loadArmor(ArmLeftID, ArmLeftDigits))
EndFunction

Function loadArmRight()
	setArmRight(loadArmor(ArmRightID, ArmRightDigits))
EndFunction

Function loadLegLeft()
	setLegLeft(loadArmor(LegLeftID, LegLeftDigits))
EndFunction

Function loadLegRight()
	setLegRight(loadArmor(LegRightID, LegRightDigits))
EndFunction

Function loadHelmetLining()
	setHelmetLining(loadLining(HelmetLiningID, HelmetLiningDigits))
EndFunction

Function loadTorsoLining()
	setTorsoLining(loadLining(TorsoLiningID, TorsoLiningDigits))
EndFunction

Function loadArmLining()
	setArmLining(loadLining(ArmLiningID, ArmLiningDigits))
EndFunction

Function loadLegLining()
	setLegLining(loadLining(LegLiningID, LegLiningDigits))
EndFunction
