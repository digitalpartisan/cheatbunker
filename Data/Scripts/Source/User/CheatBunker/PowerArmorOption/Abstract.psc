Scriptname CheatBunker:PowerArmorOption:Abstract extends Quest Hidden

Group PartMods
	FormList Property HeadlampMods Auto Const
	FormList Property HelmetMods Auto Const
	FormList Property TorsoMods Auto Const
	FormList Property ArmMods Auto Const
	FormList Property LegMods Auto Const
EndGroup

FormList Property MaterialOptions Auto Const

Bool Function hasMods()
	return ( (HeadlampMods && HeadlampMods.GetSize()) || (HelmetMods && HelmetMods.GetSize()) || (TorsoMods && TorsoMods.GetSize()) || (ArmMods && ArmMods.GetSize()) || (LegMods && LegMods.GetSize()) )
EndFunction

Bool Function canLoad()
{Override in child scripts as needed.}
	return true
EndFunction

Function refresh()
{Override in child scripts as needed.}
EndFunction

Furniture Function getCustomFrame()
{Override in child classes to alter the behavior should it be required.}
	return None
EndFunction

Armor Function getHelmet()
{Implement in child scripts.}
	CheatBunker:Logger:RemoteLoading.logFunctionalityNotImplemented(self, "getHelmet()")
	return None
EndFunction

Armor Function getTorso()
{Implement in child scripts.}
	CheatBunker:Logger:RemoteLoading.logFunctionalityNotImplemented(self, "getTorso()")
	return None
EndFunction

Armor Function getArmLeft()
{Implement in child scripts.}
	CheatBunker:Logger:RemoteLoading.logFunctionalityNotImplemented(self, "getArmLeft()")
	return None
EndFunction

Armor Function getArmRight()
{Implement in child scripts.}
	CheatBunker:Logger:RemoteLoading.logFunctionalityNotImplemented(self, "getArmRight()")
	return None
EndFunction

Armor Function getLegLeft()
{Implement in child scripts.}
	CheatBunker:Logger:RemoteLoading.logFunctionalityNotImplemented(self, "getLegLeft()")
	return None
EndFunction

Armor Function getLegRight()
{Implement in child scripts.}
	CheatBunker:Logger:RemoteLoading.logFunctionalityNotImplemented(self, "getLegRight()")
	return None
EndFunction

ObjectMod Function getHelmetLining()
{Implement in child scripts.}
	CheatBunker:Logger:RemoteLoading.logFunctionalityNotImplemented(self, "getHelmetLining()")
	return None
EndFunction

ObjectMod Function getTorsoLining()
{Implement in child scripts.}
	CheatBunker:Logger:RemoteLoading.logFunctionalityNotImplemented(self, "getTorsoLining()")
	return None
EndFunction

ObjectMod Function getArmLining()
{Implement in child scripts.}
	CheatBunker:Logger:RemoteLoading.logFunctionalityNotImplemented(self, "getArmLining()")
	return None
EndFunction

ObjectMod Function getLegLining()
{Implement in child scripts.}
	CheatBunker:Logger:RemoteLoading.logFunctionalityNotImplemented(self, "getArmLining()")
	return None
EndFunction
