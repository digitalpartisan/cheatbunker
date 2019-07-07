Scriptname CheatBunker:PowerArmorOption:Remote extends CheatBunker:PowerArmorOption:Abstract Hidden
{Scripts extending this one are intended to deal with loading power armor frames, pieces, and mods from third-party plugins.}

Import InjectTec:Utility:HexidecimalLogic

InjectTec:Plugin Property PluginToReference Auto Const Mandatory
CheatBunker:QuestScript Property CheatBunkerQuest Auto Const Mandatory

Group FrameSettings
	Int Property FrameID = 0 Auto Const
	DigitSet Property FrameDigits Auto Const
	Bool Property HasFrame = false Auto Const
EndGroup

Message Property CheatBunkerRemoteLoadingFailureMessage Auto Const Mandatory

Furniture LoadedFrame = None

Armor LoadedHelmet = None
Armor LoadedTorso = None
Armor LoadedArmLeft = None
Armor LoadedArmRight = None
Armor LoadedLegLeft = None
Armor LoadedLegRight = None

ObjectMod LoadedHelmetLining = None
ObjectMod LoadedTorsoLining = None
ObjectMod LoadedArmLining = None
ObjectMod LoadedLegLining = None

Function clean()
	LoadedFrame = None

	LoadedHelmet = None
	LoadedTorso = None
	LoadedArmLeft = None
	LoadedArmRight = None
	LoadedLegLeft = None
	LoadedLegRight = None
	
	LoadedHelmetLining = None
	LoadedTorsoLining = None
	LoadedArmLining = None
	LoadedLegLining = None
EndFunction

Function loadingFailure()
	clean()
	CheatBunkerRemoteLoadingFailureMessage.Show()
EndFunction

Bool Function canLoadFrame()
	if (FrameID || FrameDigits)
		LoadedFrame = PluginToReference.lookupWithCoalescedID(FrameID, FrameDigits) as Furniture
		if !LoadedFrame
			loadingFailure()
			return false
		endif
	endif
	
	return true
EndFunction

Function setHelmet(Armor ArmorValue)
	LoadedHelmet = ArmorValue
EndFunction

Function setTorso(Armor ArmorValue)
	LoadedTorso = ArmorValue
EndFunction

Function setArmLeft(Armor ArmorValue)
	LoadedArmLeft = ArmorValue
EndFunction

Function setArmRight(Armor ArmorValue)
	LoadedArmRight = ArmorValue
EndFunction

Function setLegLeft(Armor ArmorValue)
	LoadedLegLeft = ArmorValue
EndFunction

Function setLegRight(Armor ArmorValue)
	LoadedLegRight = ArmorValue
EndFunction

Function setHelmetLining(ObjectMod LiningValue)
	LoadedHelmetLining = LiningValue
EndFunction

Function setTorsoLining(ObjectMod LiningValue)
	LoadedTorsoLining = LiningValue
EndFunction

Function setArmLining(ObjectMod LiningValue)
	LoadedArmLining = LiningValue
EndFunction

Function setLegLining(ObjectMod LiningValue)
	LoadedLegLining = LiningValue
EndFunction

Function loadHelmet()
{Implement in child scripts.}
	CheatBunker:Logger:RemoteLoading.logFunctionalityNotImplemented(self, "loadHelmet()")
EndFunction

Function loadTorso()
{Implement in child scripts.}
	CheatBunker:Logger:RemoteLoading.logFunctionalityNotImplemented(self, "loadTorso()")
EndFunction

Function loadArmLeft()
{Implement in child scripts.}
	CheatBunker:Logger:RemoteLoading.logFunctionalityNotImplemented(self, "loadArmLeft()")
EndFunction

Function loadArmRight()
{Implement in child scripts.}
	CheatBunker:Logger:RemoteLoading.logFunctionalityNotImplemented(self, "loadArmRight()")
EndFunction

Function loadLegLeft()
{Implement in child scripts.}
	CheatBunker:Logger:RemoteLoading.logFunctionalityNotImplemented(self, "loadLegLeft()")
EndFunction

Function loadLegRight()
{Implement in child scripts.}
	CheatBunker:Logger:RemoteLoading.logFunctionalityNotImplemented(self, "loadLegRight()")
EndFunction

Function loadHelmetLining()
{Implement in child scripts.}
	CheatBunker:Logger:RemoteLoading.logFunctionalityNotImplemented(self, "loadHelmetLining()")
EndFunction

Function loadTorsoLining()
{Implement in child scripts.}
	CheatBunker:Logger:RemoteLoading.logFunctionalityNotImplemented(self, "loadTorsoLining()")
EndFunction

Function loadArmLining()
{Implement in child scripts.}
	CheatBunker:Logger:RemoteLoading.logFunctionalityNotImplemented(self, "loadArmLining()")
EndFunction

Function loadLegLining()
{Implement in child scripts.}
	CheatBunker:Logger:RemoteLoading.logFunctionalityNotImplemented(self, "loadLegLining()")
EndFunction

Bool Function canLoad()
	if (!canLoadFrame())
		return false
	endif
	
	loadHelmet()
	if (None == LoadedHelmet)
		loadingFailure()
		return false
	endif
	
	loadTorso()
	if (None == LoadedTorso)
		loadingFailure()
		return false
	endif
	
	loadArmLeft()
	if (None == LoadedArmLeft)
		loadingFailure()
		return false
	endif
	
	loadArmRight()
	if (None == LoadedArmRight)
		loadingFailure()
		return false
	endif
	
	loadLegLeft()
	if (None == LoadedLegLeft)
		loadingFailure()
		return false
	endif
	
	loadLegRight()
	if (None == LoadedLegRight)
		loadingFailure()
		return false
	endif
	
	loadHelmetLining()
	if (None == LoadedHelmetLining)
		loadingFailure()
		return false
	endif
	
	loadTorsoLining()
	if (None == LoadedTorsoLining)
		loadingFailure()
		return false
	endif
	
	loadArmLining()
	if (None == LoadedArmLining)
		loadingFailure()
		return false
	endif
	
	loadLegLining()
	if (None == LoadedLegLining)
		loadingFailure()
		return false
	endif
	
	return true
EndFunction

Furniture Function getCustomFrame()
	return LoadedFrame
EndFunction

Armor Function getHelmet()
	return LoadedHelmet
EndFunction

Armor Function getTorso()
	return LoadedTorso
EndFunction

Armor Function getArmLeft()
	return LoadedArmLeft
EndFunction

Armor Function getArmRight()
	return LoadedArmRight
EndFunction

Armor Function getLegLeft()
	return LoadedLegLeft
EndFunction

Armor Function getLegRight()
	return LoadedLegRight
EndFunction

ObjectMod Function getHelmetLining()
	return LoadedHelmetLining
EndFunction

ObjectMod Function getTorsoLining()
	return LoadedTorsoLining
EndFunction

ObjectMod Function getArmLining()
	return LoadedArmLining
EndFunction

ObjectMod Function getLegLining()
	return LoadedLegLining
EndFunction
