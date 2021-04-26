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

Struct BobbleheadRequirements
	bool strength = false
	bool perception = false
	bool endurance = false
	bool charisma = false
	bool intelligence = false
	bool agility = false
	bool luck = false
EndStruct

Struct Step
	Bool holdPerkPoint = false
	Perk nextPerk = None
	ActorValue attribute = None
	Perk nextPerkMale = None
	Perk nextPerkFemale = None
	CheatBunker:Development:Build:MultiPerkStep multiperk = None
EndStruct

string sStateWaiting = "Waiting"
string sStateWorking = "Working"

bool bWorking = false Conditional

int heldPoints = 0 Conditional

int expectedLevel = 0 Conditional
int expectedStrength = 0 Conditional
int expectedPerception = 0 Conditional
int expectedEndurance = 0 Conditional
int expectedCharisma = 0 Conditional
int expectedIntelligence = 0 Conditional
int expectedAgility = 0 Conditional
int expectedLuck = 0 Conditional

CheatBunker:DevelopmentScript Property CheatBunkerDevelopmentScript Auto Const Mandatory

CheatBunker:DevelopmentScript Function getDevelopmentScript()
	return CheatBunkerDevelopmentScript
EndFunction

function clearExpectations()
	heldPoints = 0
	expectedLevel = 0
	expectedStrength = 0
	expectedPerception = 0
	expectedEndurance = 0
	expectedCharisma = 0
	expectedIntelligence = 0
	expectedAgility = 0
	expectedLuck = 0
endfunction

function incrementExpectedLevel()
	expectedLevel += 1
endfunction

bool function hasHeldPoints()
	return heldPoints > 0
endfunction

function incrementHeldPoints()
	heldPoints += 1
endfunction

function decrementHeldPoints()
	heldPoints -= 1
endfunction

function setExpectedStrength(int value)
	expectedStrength = value
endfunction

function incrementExpectedStrength()
	expectedStrength += 1
endfunction

function setExpectedPerception(int value)
	expectedPerception = value
endfunction

function incrementExpectedPerception()
	expectedPerception += 1
endfunction

function setExpectedEndurance(int value)
	expectedEndurance = value
endfunction

function incrementExpectedEndurance()
	expectedEndurance += 1
endfunction

function setExpectedCharisma(int value)
	expectedCharisma = value
endfunction

function incrementExpectedCharisma()
	expectedCharisma += 1
endfunction

function setExpectedIntelligence(int value)
	expectedIntelligence = value
endfunction

function incrementExpectedIntelligence()
	expectedIntelligence += 1
endfunction

function setExpectedAgility(int value)
	expectedAgility = value
endfunction

function incrementExpectedAgility()
	expectedAgility += 1
endfunction

function setExpectedLuck(int value)
	expectedLuck = value
endfunction

function incrementExpectedLuck()
	expectedLuck += 1
endfunction

bool function isWorking()
	return bWorking
endfunction

Function advanceLevel()
	CheatBunker:DevelopmentScript characterDevelopment = getDevelopmentScript()

	characterDevelopment.addPerkPoints(255) ; so that advancing a level will zero out the perk points to keep things nice and clean for the player
	characterDevelopment.addLevels(1);
EndFunction

bool function enforceLevel()
	Actor aPlayer = Game.GetPlayer()
	while (aPlayer.GetLevel() < expectedLevel)
		advanceLevel()
	endWhile

	return true
endfunction

bool function incrementAttributeExpectation(ActorValue attribute)
	CheatBunker:DevelopmentScript development = getDevelopmentScript()

	bool bResult = true

	if (development.Strength == attribute)
		incrementExpectedStrength()
	elseif (development.Perception == attribute)
		incrementExpectedPerception()
	elseif (development.Endurance == attribute)
		incrementExpectedEndurance()
	elseif (development.Charisma == attribute)
		incrementExpectedCharisma()
	elseif (development.Intelligence == attribute)
		incrementExpectedIntelligence()
	elseif (development.Agility == attribute)
		incrementExpectedAgility()
	elseif (development.Luck == attribute)
		incrementExpectedLuck()
	else
		bResult = false
	endif

	return bResult
endfunction

bool function augmentSpecialValue(ActorValue attribute)
	if (!attribute)
		return false
	endif

	Actor aPlayer = Game.GetPlayer()
	advanceLevel()
	aPlayer.SetValue(attribute, aPlayer.GetValue(attribute) + 1)

	return true
endfunction

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

bool function enforceBobbleheads(BobbleheadRequirements bobbleheads)
	if (!bobbleheads)
		return false
	endif

	Actor aPlayer = Game.GetPlayer()
	CheatBunker:DevelopmentScript development = getDevelopmentScript()

	if (bobbleheads.strength)
		aPlayer.SetValue(development.Strength, aPlayer.GetValue(development.Strength) + 1)
		incrementExpectedStrength()
	endif

	if (bobbleheads.perception)
		aPlayer.SetValue(development.Perception, aPlayer.GetValue(development.Perception) + 1)
		incrementExpectedPerception()
	endif

	
	if (bobbleheads.endurance)
		aPlayer.SetValue(development.Endurance, aPlayer.GetValue(development.Endurance) + 1)
		incrementExpectedEndurance()
	endif

	
	if (bobbleheads.charisma)
		aPlayer.SetValue(development.Charisma, aPlayer.GetValue(development.Charisma) + 1)
		incrementExpectedCharisma()
	endif

	
	if (bobbleheads.intelligence)
		aPlayer.SetValue(development.Intelligence, aPlayer.GetValue(development.Intelligence) + 1)
		incrementExpectedIntelligence()
	endif

	
	if (bobbleheads.agility)
		aPlayer.SetValue(development.Agility, aPlayer.GetValue(development.Agility) + 1)
		incrementExpectedAgility()
	endif

	
	if (bobbleheads.luck)
		aPlayer.SetValue(development.Luck, aPlayer.GetValue(development.Luck) + 1)
		incrementExpectedLuck()
	endif

	return true
endfunction

bool function enforceSpecials()
	CheatBunker:DevelopmentScript development = getDevelopmentScript()
	return enforceSpecialValue(development.Strength, expectedStrength) && enforceSpecialValue(development.Perception, expectedPerception) && enforceSpecialValue(development.Endurance, expectedEndurance) && enforceSpecialValue(development.Charisma, expectedCharisma) && enforceSpecialValue(development.Intelligence, expectedIntelligence) && enforceSpecialValue(development.Agility, expectedAgility) && enforceSpecialValue(development.Luck, expectedLuck)
endfunction

bool function enforceExpectations()
	return enforceSpecials() && enforceLevel()
endfunction

Bool Function enforceStartingStats(StartingStats values, BobbleheadRequirements bobbleheads)
	if (!values)
		return false
	endif

	expectedStrength = values.strength
	expectedPerception = values.Perception
	expectedEndurance = values.endurance
	expectedCharisma = values.charisma
	expectedIntelligence = values.intelligence
	expectedAgility = values.agility
	expectedLuck = values.luck

	enforceSpecials()

	enforceBobbleheads(bobbleheads)
EndFunction

Bool Function enforcePerk(Perk thePerk)
	if (!thePerk)
		return false
	endif

	Actor aPlayer = Game.GetPlayer()
	if (aPlayer.HasPerk(thePerk))
		return true
	endif

	if (hasHeldPoints())
		decrementHeldPoints()
	else
		advanceLevel()
	endif

	aPlayer.AddPerk(thePerk)
	return true
EndFunction

Bool function enforceStepPerk(Step values)
	if (values.nextPerk && (values.nextPerkMale || values.nextPerkFemale))
		return false
	endif

	if (values.nextPerk)
		return enforcePerk(values.nextPerk)
	endif

	if (Game.GetPlayer().GetActorBase().GetSex() == 0)
		return enforcePerk(values.nextPerkMale)
	else
		return enforcePerk(values.nextPerkFemale)
	endif

	return false
endfunction

bool function enforceStep(Step values)
	if (!values)
		return false
	endif

	incrementExpectedLevel()

	if (values.holdPerkPoint)
		incrementHeldPoints()
	else
		if (values.multiperk)
			enforcePerks(values.multiperk.getPerks())
			enforcePerks(values.multiperk.getMalePerks())
			enforcePerks(values.multiperk.getFemalePerks())
		else
			incrementAttributeExpectation(values.attribute)
			enforceStepPerk(values)
		endif
	endif

	enforceExpectations()
endfunction

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
		clearExpectations()
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
