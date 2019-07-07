Scriptname CheatBunker:PowerArmorOption:Remote:Simple extends CheatBunker:PowerArmorOption:Remote

Import InjectTec:Utility:HexidecimalLogic

Group PartIDs
	DigitSet Property HelmetDigits Auto Const Mandatory
	DigitSet Property TorsoDigits Auto Const Mandatory
	DigitSet Property ArmLeftDigits Auto Const Mandatory
	DigitSet Property ArmRightDigits Auto Const Mandatory
	DigitSet Property LegLeftDigits Auto Const Mandatory
	DigitSet Property LegRightDigits Auto Const Mandatory
EndGroup

Group LiningIDs
	DigitSet Property HelmetLiningDigits Auto Const Mandatory
	DigitSet Property TorsoLiningDigits Auto Const Mandatory
	DigitSet Property ArmLiningDigits Auto Const Mandatory
	DigitSet Property LegLiningDigits Auto Const Mandatory
EndGroup

Armor Function loadArmor(DigitSet RemoteDigits)
	return PluginToReference.lookupWithDigits(RemoteDigits) as Armor
EndFunction

ObjectMod Function loadLining(DigitSet RemoteDigits)
	return PluginToReference.lookupWithDigits(RemoteDigits) as ObjectMod
EndFunction

Function loadHelmet()
	setHelmet(loadArmor(HelmetDigits))
EndFunction

Function loadTorso()
	setTorso(loadArmor(TorsoDigits))
EndFunction

Function loadArmLeft()
	setArmLeft(loadArmor(ArmLeftDigits))
EndFunction

Function loadArmRight()
	setArmRight(loadArmor(ArmRightDigits))
EndFunction

Function loadLegLeft()
	setLegLeft(loadArmor(LegLeftDigits))
EndFunction

Function loadLegRight()
	setLegRight(loadArmor(LegRightDigits))
EndFunction

Function loadHelmetLining()
	setHelmetLining(loadLining(HelmetLiningDigits))
EndFunction

Function loadTorsoLining()
	setTorsoLining(loadLining(TorsoLiningDigits))
EndFunction

Function loadArmLining()
	setArmLining(loadLining(ArmLiningDigits))
EndFunction

Function loadLegLining()
	setLegLining(loadLining(LegLiningDigits))
EndFunction
