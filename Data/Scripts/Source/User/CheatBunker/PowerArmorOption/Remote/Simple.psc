Scriptname CheatBunker:PowerArmorOption:Remote:Simple extends CheatBunker:PowerArmorOption:Remote

Group PartIDs
	Int Property HelmetID = 0 Auto Const Mandatory
	Int Property TorsoID = 0 Auto Const Mandatory
	Int Property ArmLeftID = 0 Auto Const Mandatory
	Int Property ArmRightID = 0 Auto Const Mandatory
	Int Property LegLeftID = 0 Auto Const Mandatory
	Int Property LegRightID = 0 Auto Const Mandatory
EndGroup

Group LiningIDs
	Int Property HelmetLiningID = 0 Auto Const Mandatory
	Int Property TorsoLiningID = 0 Auto Const Mandatory
	Int Property ArmLiningID = 0 Auto Const Mandatory
	Int Property LegLiningID = 0 Auto Const Mandatory
EndGroup

Function loadHelmet()
	setHelmet(PluginToReference.lookupForm(HelmetID) as Armor)
EndFunction

Function loadTorso()
	setTorso(PluginToReference.lookupForm(TorsoID) as Armor)
EndFunction

Function loadArmLeft()
	setArmLeft(PluginToReference.lookupForm(ArmLeftID) as Armor)
EndFunction

Function loadArmRight()
	setArmRight(PluginToReference.lookupForm(ArmRightID) as Armor)
EndFunction

Function loadLegLeft()
	setLegLeft(PluginToReference.lookupForm(LegLeftID) as Armor)
EndFunction

Function loadLegRight()
	setLegRight(PluginToReference.lookupForm(LegRightID) as Armor)
EndFunction

Function loadHelmetLining()
	setHelmetLining(PluginToReference.lookupForm(HelmetLiningID) as ObjectMod)
EndFunction

Function loadTorsoLining()
	setTorsoLining(PluginToReference.lookupForm(TorsoLiningID) as ObjectMod)
EndFunction

Function loadArmLining()
	setArmLining(PluginToReference.lookupForm(ArmLiningID) as ObjectMod)
EndFunction

Function loadLegLining()
	setLegLining(PluginToReference.lookupForm(LegLiningID) as ObjectMod)
EndFunction
