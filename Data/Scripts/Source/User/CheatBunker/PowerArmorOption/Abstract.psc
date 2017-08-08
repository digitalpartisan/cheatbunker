Scriptname CheatBunker:PowerArmorOption:Abstract extends Quest Hidden

Bool Property HasMods = false Auto Const

Group PartMods
	DynamicTerminal:ListWrapper Property HeadlampMods Auto Const
	DynamicTerminal:ListWrapper Property HelmetMods Auto Const
	DynamicTerminal:ListWrapper Property TorsoMods Auto Const
	DynamicTerminal:ListWrapper Property ArmMods Auto Const
	DynamicTerminal:ListWrapper Property LegMods Auto Const
EndGroup

DynamicTerminal:ListWrapper Property MaterialOptions Auto Const

Bool Function canLoad()
{Override in child scripts as needed.}
	return true
EndFunction

Function clean()
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
