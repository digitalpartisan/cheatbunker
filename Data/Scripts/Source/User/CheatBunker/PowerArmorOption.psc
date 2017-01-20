Scriptname CheatBunker:PowerArmorOption extends Quest Conditional

Furniture Property Frame Auto Const
{Because some power armor sets might use a frame other than the game's default and it's a bad idea to }

Group Parts
	Armor Property Helmet Auto Const
	Armor Property Torso Auto Const
	Armor Property ArmLeft Auto Const
	Armor Property ArmRight Auto Const
	Armor Property LegLeft Auto Const
	Armor Property LegRight Auto Const
EndGroup

Group PartLevels
	ObjectMod Property HelmetLining Auto Const
	ObjectMod Property TorsoLining Auto Const
	ObjectMod Property ArmLining Auto Const
	ObjectMod Property LegLining Auto Const
EndGroup

Bool Property HasMods = false Auto Const

Group PartMods
	DynamicTerminal:ListWrapper Property HeadlampMods Auto Const
	DynamicTerminal:ListWrapper Property HelmetMods Auto Const
	DynamicTerminal:ListWrapper Property TorsoMods Auto Const
	DynamicTerminal:ListWrapper Property ArmMods Auto Const
	DynamicTerminal:ListWrapper Property LegMods Auto Const
EndGroup

DynamicTerminal:ListWrapper Property MaterialOptions Auto Const
