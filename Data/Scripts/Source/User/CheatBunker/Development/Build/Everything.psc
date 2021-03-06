Scriptname CheatBunker:Development:Build:Everything extends CheatBunker:Development:Build

FormList Property CheatBunkerPackageBaseBuilds00EverythingPerks Auto Const Mandatory
FormList Property CheatBunkerPackageBaseBuilds00EverythingPerksMale Auto Const Mandatory
FormList Property CheatBunkerPackageBaseBuilds00EverythingPerksFemale Auto Const Mandatory

InjectTec:Plugin Property CheatBunkerQuestControlPlugin3FarHarbor Auto Const Mandatory
InjectTec:Utility:HexidecimalLogic:DigitSet[] Property FarHarborPerkDigits Auto Const Mandatory
InjectTec:Utility:HexidecimalLogic:DigitSet[] Property FarHarborPerkDigitsMale Auto Const
InjectTec:Utility:HexidecimalLogic:DigitSet[] Property FarHarborPerkDigitsFemale Auto Const

InjectTec:Plugin Property CheatBunkerQuestControlPlugin6NukaWorld Auto Const Mandatory
InjectTec:Utility:HexidecimalLogic:DigitSet[] Property NukaWorldPerkDigits Auto Const Mandatory
InjectTec:Utility:HexidecimalLogic:DigitSet[] Property NukaWorldPerkDigitsMale Auto Const
InjectTec:Utility:HexidecimalLogic:DigitSet[] Property NukaWorldPerkDigitsFemale Auto Const

function applyDLC(InjectTec:Plugin targetPlugin, InjectTec:Utility:HexidecimalLogic:DigitSet[] targetDigits, InjectTec:Utility:HexidecimalLogic:DigitSet[] targetDigitsMale, InjectTec:Utility:HexidecimalLogic:DigitSet[] targetDigitsFemale)
	if (!targetPlugin || !targetPlugin.isInstalled() || !targetDigits || !targetDigits.length)
		return
	endif

	CheatBunker:Development:Utility buildUtility = CheatBunker:Dependencies:General.getInstance().getDevelopmentUtility()
	buildUtility.enforcePerks(targetPlugin.lookupArray(targetDigits) as Perk[])

	if (Game.GetPlayer().GetActorBase().GetSex() == 0)
		targetDigitsMale && targetDigitsMale.length && buildUtility.enforcePerks(targetPlugin.lookupArray(targetDigitsMale) as Perk[])
	else
		targetDigitsFemale && targetDigitsFemale.length && buildUtility.enforcePerks(targetPlugin.lookupArray(targetDigitsFemale) as Perk[])
	endif
endfunction

Function apply(int progressionPercentage = 100)
	CheatBunker:Development:Utility buildUtility = CheatBunker:Dependencies:General.getInstance().getDevelopmentUtility()

	CheatBunker:Development:Utility:StartingStats maxSpecial = new CheatBunker:Development:Utility:StartingStats
	maxSpecial.strength = 10
	maxSpecial.perception = 10
	maxSpecial.endurance = 10
	maxSpecial.charisma = 10
	maxSpecial.intelligence = 10
	maxSpecial.agility = 10
	maxSpecial.luck = 10
	buildUtility.enforceStartingStats(maxSpecial)

	buildUtility.enforcePerkList(CheatBunkerPackageBaseBuilds00EverythingPerks)
	if (Game.GetPlayer().GetActorBase().GetSex() == 0)
		buildUtility.enforcePerkList(CheatBunkerPackageBaseBuilds00EverythingPerksMale)
	else
		buildUtility.enforcePerkList(CheatBunkerPackageBaseBuilds00EverythingPerksFemale)
	endif

	applyDLC(CheatBunkerQuestControlPlugin3FarHarbor, FarHarborPerkDigits, FarHarborPerkDigitsMale, FarHarborPerkDigitsFemale)
	applyDLC(CheatBunkerQuestControlPlugin6NukaWorld, NukaWorldPerkDigits, NukaWorldPerkDigitsMale, NukaWorldPerkDigitsFemale)
EndFunction
