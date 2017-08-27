Scriptname CheatBunker:PowerArmorOption:Complex extends cheatbunker:powerarmoroption:abstract

InjectTec:Plugin Property PluginToReference Auto Const Mandatory
CheatBunker:QuestScript Property CheatBunkerQuest Auto Const Mandatory

Group FrameSettings
	Furniture Property Frame = None Auto Const
	Int Property FrameID = 0 Auto Const
EndGroup

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



Furniture Function getCustomFrame()
{Existing PA options had this set.  Removing properties or changing their values is not feasible at the time of writing the Remote Loading features, so the Frame property stays around on this script.}
	if (None != Frame)
		return Frame
	else
		return None
	endif
EndFunction
