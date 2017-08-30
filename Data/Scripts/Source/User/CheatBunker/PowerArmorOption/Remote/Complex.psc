Scriptname CheatBunker:PowerArmorOption:Remote:Complex extends CheatBunker:PowerArmorOption:Remote
{This armor loader is intended to handle complicated cases where a third-party plugin provides less than a whole set and pieces from the base game must be substituted to complete the set.}

Group HelmetSettings
	Armor Property Helmet = None Auto Const
	Int Property HelmetID = 0 Auto Const
EndGroup

Group TorsoSettings
	Armor Property Torso = None Auto Const
	Int Property TorsoID = 0 Auto Const
EndGroup

Group ArmLeftSettings
	Armor Property ArmLeft = None Auto Const
	Int Property ArmLeftID = 0 Auto Const
EndGroup

Group ArmRightSettings
	Armor Property ArmRight = None Auto Const
	Int Property ArmRightID = 0 Auto Const
EndGroup

Group LegLeftSettings
	Armor Property LegLeft = None Auto Const
	Int Property LegLeftID = 0 Auto Const
EndGroup

Group LegRightSettings
	Armor Property LegRight = None Auto Const
	Int Property LegRightID = 0 Auto Const
EndGroup

Group HelmetLiningSettings
	ObjectMod Property HelmetLining = None Auto Const
	Int Property HelmetLiningID = 0 Auto Const
EndGroup

Group TorsoLiningSettings
	ObjectMod Property TorsoLining = None Auto Const
	Int Property TorsoLiningID = 0 Auto Const
EndGroup

Group ArmLiningSettings
	ObjectMod Property ArmLining = None Auto Const
	Int Property ArmLiningID = 0 Auto Const
EndGroup

Group LegLiningSettings
	ObjectMod Property LegLining = None Auto Const
	Int Property LegliningID = 0 Auto Const
EndGroup

Form Function loadForm(Form LocalForm = None, Int RemoteID = 0)
	if (None == LocalForm)
		return PluginToReference.lookupForm(RemoteID)
	else
		return LocalForm
	endif
EndFunction

Armor Function loadArmor(Armor LocalArmor = None, Int RemoteID = 0)
	return loadForm(LocalArmor, RemoteID) as Armor
EndFunction

ObjectMod Function loadLining(ObjectMod LocalLining = None, Int RemoteID = 0)
	return loadForm(LocalLining, RemoteID) as ObjectMod
EndFunction

Function loadHelmet()
	setHelmet(loadArmor(Helmet, HelmetID))
EndFunction

Function loadTorso()
	setTorso(loadArmor(Torso, TorsoID))
EndFunction

Function loadArmLeft()
	setArmLeft(loadArmor(ArmLeft, ArmLeftID))
EndFunction

Function loadArmRight()
	setArmRight(loadArmor(ArmRight, ArmRightID))
EndFunction

Function loadLegLeft()
	setLegLeft(loadArmor(LegLeft, LegLeftID))
EndFunction

Function loadLegRight()
	setLegRight(loadArmor(LegRight, LegRightID))
EndFunction

Function loadHelmetLining()
	setHelmetLining(loadLining(HelmetLining, HelmetLiningID))
EndFunction

Function loadTorsoLining()
	setTorsoLining(loadLining(TorsoLining, TorsoLiningID))
EndFunction

Function loadArmLining()
	setArmLining(loadLining(ArmLining, ArmLiningID))
EndFunction

Function loadLegLining()
	setLegLining(loadLining(LegLining, LegLiningID))
EndFunction
