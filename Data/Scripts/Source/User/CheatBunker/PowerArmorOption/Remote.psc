Scriptname CheatBunker:PowerArmorOption:Remote extends CheatBunker:PowerArmorOption:Abstract

InjectTec:Plugin Property PluginToReference Auto Const Mandatory
CheatBunker:QuestScript Property CheatBunkerQuest Auto Const Mandatory

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

Group FrameSettings
	Int Property FrameID = 0 Auto Const
	Bool Property HasFrame = false Auto Const
EndGroup

Furniture CustomFrame = None

Armor Helmet = None
Armor Torso = None
Armor ArmLeft = None
Armor ArmRight = None
Armor LegLeft = None
Armor LegRight = None

ObjectMod HelmetLining = None
ObjectMod TorsoLining = None
ObjectMod ArmLining = None
ObjectMod LegLining = None

Function clean()
	CustomFrame = None

	Helmet = None
	Torso = None
	ArmLeft = None
	ArmRight = None
	LegLeft = None
	LegRight = None
	
	HelmetLining = None
	TorsoLining = None
	ArmLining = None
	LegLining = None
EndFunction

Function loadingFailure()
	clean()
	CheatBunkerQuest.remoteLoadingFailure()
EndFunction

Bool Function canLoadFrame()
	if (HasFrame)
		CustomFrame = PluginToReference.lookupForm(FrameID) as Furniture
		if (None == CustomFrame)
			loadingFailure()
			return false
		endif
	endif
	
	return true
EndFunction

Bool Function canLoadParts()
	Helmet = PluginToReference.lookupForm(HelmetID) as Armor
	if (None == Helmet)
		loadingFailure()
		return false
	endif
	
	Torso = PluginToReference.lookupForm(TorsoID) as Armor
	if (None == Torso)
		loadingFailure()
		return false
	endif
	
	ArmLeft = PluginToReference.lookupForm(ArmLeftID) as Armor
	if (None == ArmLeft)
		loadingFailure()
		return false
	endif
	
	ArmRight = PluginToReference.lookupForm(ArmRightID) as Armor
	if (None == ArmRight)
		loadingFailure()
		return false
	endif
	
	LegLeft = PluginToReference.lookupForm(LegLeftID) as Armor
	if (None == LegLeft)
		loadingFailure()
		return false
	endif
	
	LegRight = PluginToReference.lookupForm(LegRightID) as Armor
	if (None == LegRight)
		loadingFailure()
		return false
	endif
	
	return true
EndFunction

Bool Function canLoadLinings()
	HelmetLining = PluginToReference.lookupForm(HelmetLiningID) as ObjectMod
	if (None == HelmetLining)
		loadingFailure()
		return false
	endif
	
	TorsoLining = PluginToReference.lookupForm(TorsoLiningID) as ObjectMod
	if (None == TorsoLining)
		loadingFailure()
		return false
	endif
	
	ArmLining = PluginToReference.lookupForm(ArmLiningID) as ObjectMod
	if (None == ArmLining)
		loadingFailure()
		return false
	endif
	
	LegLining = PluginToReference.lookupForm(LegLiningID) as ObjectMod
	if (None == LegLining)
		loadingFailure()
		return false
	endif
	
	return true
EndFunction

Bool Function canLoad()
	return canLoadFrame() && canLoadParts() && canLoadLinings()
EndFunction

Furniture Function getCustomFrame()
	return CustomFrame
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
