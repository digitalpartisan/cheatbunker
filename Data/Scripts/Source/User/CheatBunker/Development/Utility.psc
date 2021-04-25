Scriptname CheatBunker:Development:Utility extends Quest Conditional

Struct StartingStats
	Int strength = 1
	Int perception = 1
	Int endurance = 1
	Int charisma = 1
	Int intelligence = 1
	Int agility = 1
	Int luck = 1
EndStruct

Struct Step
	Int strength = 1
	Int perception = 1
	Int endurance = 1
	Int charisma = 1
	Int intelligence = 1
	Int agility = 1
	Int luck = 1
	Perk nextPerk = None
	Perk nextPerkMale = None
	Perk nextPerkFemale = None
EndStruct

String sStateWaiting = "Waiting"
String sStateWorking = "Working"

Bool bWorking = false Conditional

CheatBunker:DevelopmentScript Property CheatBunkerDevelopmentScript Auto Const Mandatory

CheatBunker:DevelopmentScript Function getDevelopmentScript()
	return CheatBunkerDevelopmentScript
EndFunction

bool function isWorking()
	return bWorking
endfunction

Function advanceLevel()
	CheatBunker:DevelopmentScript characterDevelopment = getDevelopmentScript()

	characterDevelopment.addPerkPoints(255) ; so that advancing a level will zero out the perk points to keep things nice and clean for the player
	characterDevelopment.addLevels(1);
EndFunction

Bool Function enforceSpecialValue(ActorValue attribute, Int value)
	if (!attribute)
		return false
	endif

	if (value < 1 || 10 < value)
		return false
	endif

	Actor aPlayer = Game.GetPlayer()
	while (aPlayer.GetValue(attribute) < value)
		advanceLevel()
		aPlayer.SetValue(attribute, aPlayer.GetValue(attribute) + 1)
	endWhile

	return true
EndFunction

Bool Function enforceStrength(Int value)
	return enforceSpecialValue(getDevelopmentScript().Strength, value)
EndFunction

Bool Function enforcePerception(Int value)
	return enforceSpecialValue(getDevelopmentScript().Perception, value)
EndFunction

Bool Function enforceEndurance(Int value)
	return enforceSpecialValue(getDevelopmentScript().Endurance, value)
EndFunction

Bool Function enforceCharisma(Int value)
	return enforceSpecialValue(getDevelopmentScript().Charisma, value)
EndFunction

Bool Function enforceIntelligence(Int value)
	return enforceSpecialValue(getDevelopmentScript().Intelligence, value)
EndFunction

Bool Function enforceAgility(Int value)
	return enforceSpecialValue(getDevelopmentScript().Agility, value)
EndFunction

Bool Function enforceLuck(Int value)
	return enforceSpecialValue(getDevelopmentScript().Luck, value)
EndFunction

Bool Function enforceStartingStats(StartingStats values)
	if (!values)
		return false
	endif

	return enforceStrength(values.strength) && enforcePerception(values.perception) && enforceEndurance(values.endurance) && enforceCharisma(values.charisma) && enforceIntelligence(values.intelligence) && enforceAgility(values.agility) && enforceLuck(values.luck)
EndFunction

Bool Function enforcePerk(Perk thePerk)
	if (!thePerk)
		return false
	endif

	Actor aPlayer = Game.GetPlayer()
	if (aPlayer.HasPerk(thePerk))
		return true
	endif

	advanceLevel()
	aPlayer.AddPerk(thePerk)
	return true
EndFunction

Bool Function enforceStep(Step values)
	if (!values)
		return false
	endif

	return enforceStrength(values.strength) && enforcePerception(values.perception) && enforceEndurance(values.endurance) && enforceCharisma(values.charisma) && enforceIntelligence(values.intelligence) && enforceAgility(values.agility) && enforceLuck(values.luck) && (enforcePerk(values.nextPerk) || enforcePerk(values.nextPerkMale) || enforcePerk(values.nextPerkFemale))
EndFunction

Bool function enforcePerks(Perk[] perks)
	if (!perks || !perks.length)
		return false
	endif

	int iCounter = 0
	while (iCounter < perks.length)
		if (!enforcePerk(perks[iCounter]))
			return false
		endif
		iCounter += 1
	endwhile

	return true
endfunction

Bool Function enforcePerkList(FormList perks)
	if (!perks || !perks.getSize())
		return false
	endif

	Int iSize = perks.GetSize()
	Int iCounter = 0
	while (iCounter < iSize)
		if (!enforcePerk(perks.GetAt(iCounter) as Perk))
			return false
		endif
		iCounter += 1
	endWhile

	return true
EndFunction

Function goToWorking()

EndFunction

Function goToWaiting()

EndFunction

Function apply(CheatBunker:Development:Build build)
	
EndFunction

Auto State Waiting
	Event OnBeginState(String asOldState)
		bWorking = false
	EndEvent

	Function goToWorking()
		GoToState(sStateWorking)
	EndFunction

	Function apply(CheatBunker:Development:Build build)
		goToWorking()
		build.apply()
		goToWaiting()
	EndFunction
EndState

State Working
	Event OnBeginState(String asOldState)
		bWorking = true
	EndEvent

	Function goToWaiting()
		GoToState(sStateWaiting)
	EndFunction
EndState
