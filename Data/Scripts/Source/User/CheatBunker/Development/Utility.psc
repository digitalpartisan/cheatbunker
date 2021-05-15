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
	Bool holdPerkPoint = false
	Perk nextPerk = None
	ActorValue attribute = None
	Perk nextPerkMale = None
	Perk nextPerkFemale = None
	CheatBunker:Development:Build:MultiPerkStep multiperk = None
	Bool noLevel = false
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
	expectedLevel = 1
	expectedStrength = 1
	expectedPerception = 1
	expectedEndurance = 1
	expectedCharisma = 1
	expectedIntelligence = 1
	expectedAgility = 1
	expectedLuck = 1
endfunction

function incrementExpectedLevel()
	expectedLevel += 1
	CheatBunker:Development:Logger.incrementingExpectedLevel(expectedLevel)
endfunction

bool function hasHeldPoints()
	return getHeldPoints() > 0
endfunction

int function getHeldPoints()
	return heldPoints
endfunction

function incrementHeldPoints()
	heldPoints += 1
endfunction

function decrementHeldPoints()
	heldPoints -= 1
endfunction

bool function isWorking()
	return bWorking
endfunction

Function advanceLevel()
	CheatBunker:DevelopmentScript characterDevelopment = getDevelopmentScript()

	characterDevelopment.addPerkPoints(255) ; so that advancing a level will zero out the perk points to keep things nice and clean for the player
	characterDevelopment.addLevels(1)

	CheatBunker:Development:Logger.advancingLevel(Game.GetPlayer().GetLevel())
EndFunction

bool function enforceLevel()
	Actor aPlayer = Game.GetPlayer()
	while (aPlayer.GetLevel() < expectedLevel)
		advanceLevel()
	endWhile

	return true
endfunction

bool function incrementAttributeExpectation(ActorValue attribute, bool bNoLevel = false)
	if (!attribute)
		return false
	endif

	CheatBunker:DevelopmentScript development = getDevelopmentScript()

	bool bResult = true
	int value = 0

	if (development.Strength == attribute)
		expectedStrength += 1
		value = expectedStrength
	elseif (development.Perception == attribute)
		expectedPerception += 1
		value = expectedPerception
	elseif (development.Endurance == attribute)
		expectedEndurance += 1
		value = expectedEndurance
	elseif (development.Charisma == attribute)
		expectedCharisma += 1
		value = expectedCharisma
	elseif (development.Intelligence == attribute)
		expectedIntelligence += 1
		value = expectedIntelligence
	elseif (development.Agility == attribute)
		expectedAgility += 1
		value = expectedAgility
	elseif (development.Luck == attribute)
		expectedLuck += 1
		value = expectedLuck
	else
		bResult = false
	endif

	CheatBunker:Development:Logger.incrementingExpectedAttributeValue(attribute, value, bNoLevel)
	bResult && bNoLevel && Game.GetPlayer().SetValue(attribute, value)

	return bResult
endfunction

bool function augmentSpecialValue(ActorValue attribute)
	if (!attribute)
		return false
	endif

	Actor aPlayer = Game.GetPlayer()
	advanceLevel()
	aPlayer.SetValue(attribute, aPlayer.GetValue(attribute) + 1)

	CheatBunker:Development:Logger.augmentingAttributeValue(attribute, aPlayer.GetValue(attribute) as int)

	return true
endfunction

Bool Function enforceSpecialValue(ActorValue attribute, Int value)
	if (!attribute)
		return false
	endif

	if (value < 1) ; 11 is possible due to bobbleheads / special book
		return false
	endif

	Actor aPlayer = Game.GetPlayer()
	while (aPlayer.GetValue(attribute) < value)
		advanceLevel()
		aPlayer.SetValue(attribute, aPlayer.GetValue(attribute) + 1)
	endWhile

	return true
EndFunction

bool function enforceBobbleheads()
	CheatBunker:Development:Logger.applyingBobbleheads()

	CheatBunker:DevelopmentScript development = getDevelopmentScript()
	
	incrementAttributeExpectation(development.Strength, true)
	incrementAttributeExpectation(development.Perception, true)
	incrementAttributeExpectation(development.Endurance, true)
	incrementAttributeExpectation(development.Charisma, true)
	incrementAttributeExpectation(development.Intelligence, true)
	incrementAttributeExpectation(development.Agility, true)
	incrementAttributeExpectation(development.Luck, true)

	return true
endfunction

bool function enforceSpecials()
	CheatBunker:DevelopmentScript development = getDevelopmentScript()
	
	enforceSpecialValue(development.Strength, expectedStrength)
	enforceSpecialValue(development.Perception, expectedPerception)
	enforceSpecialValue(development.Endurance, expectedEndurance)
	enforceSpecialValue(development.Charisma, expectedCharisma)
	enforceSpecialValue(development.Intelligence, expectedIntelligence)
	enforceSpecialValue(development.Agility, expectedAgility)
	enforceSpecialValue(development.Luck, expectedLuck)

	return true
endfunction

bool function enforceExpectations()
	enforceSpecials()
	enforceLevel()

	return true
endfunction

Bool Function enforceStartingStats(StartingStats values, bool bBobbleheads = true)
	if (!values)
		return false
	endif

	CheatBunker:Development:Logger.enforcingStartingStats(values)

	expectedStrength = values.strength
	expectedPerception = values.Perception
	expectedEndurance = values.endurance
	expectedCharisma = values.charisma
	expectedIntelligence = values.intelligence
	expectedAgility = values.agility
	expectedLuck = values.luck

	enforceSpecials()

	bBobbleheads && enforceBobbleheads()
EndFunction

Bool Function enforcePerk(Perk thePerk, bool bUseHeldPoints = false)
	if (!thePerk)
		return false
	endif

	Actor aPlayer = Game.GetPlayer()
	if (aPlayer.HasPerk(thePerk))
		return true
	endif

	if (bUseHeldPoints && hasHeldPoints())
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

Bool function enforcePerks(Perk[] perks, bool bUseHeldPoints = false)
	if (!perks || !perks.length)
		return false
	endif

	int iCounter = 0
	while (iCounter < perks.length)
		if (!enforcePerk(perks[iCounter], bUseHeldPoints))
			return false
		endif
		iCounter += 1
	endwhile

	return true
endfunction

bool function enforceMultiperks(CheatBunker:Development:Build:MultiPerkStep multiperk)
	enforcePerks(multiperk.getPerks(), true)
	enforcePerks(multiperk.getMalePerks(), true)
	enforcePerks(multiperk.getFemalePerks(), true)
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

bool function enforceStep(Step values)
	if (!values)
		return false
	endif

	CheatBunker:Development:Logger.enforcingStep(values)

	!values.noLevel && incrementExpectedLevel()

	if (values.holdPerkPoint)
		incrementHeldPoints()
	else
		if (values.multiperk)
			enforceMultiperks(values.multiperk)
		else
			incrementAttributeExpectation(values.attribute, values.noLevel)
			enforceStepPerk(values)
		endif
	endif

	enforceExpectations()
endfunction

bool function awardRemainingPerkPoints()
	
endfunction

Function goToWorking()

EndFunction

Function goToWaiting()

EndFunction

Function apply(CheatBunker:Development:Build build, int progressionPercentage = 100)
	
EndFunction

Auto State Waiting
	Event OnBeginState(String asOldState)
		bWorking = false
	EndEvent

	Function goToWorking()
		GoToState(sStateWorking)
	EndFunction

	Function apply(CheatBunker:Development:Build build, int progressionPercentage = 100)
		goToWorking()
		CheatBunker:Development:Logger.applyingBuild(build)
		clearExpectations()
		build.apply(progressionPercentage)
		getDevelopmentScript().addPerkPoints(getHeldPoints()) ; in case a build doesn't quite complete and the player has the option of using a point somehow
		CheatBunker:Development:Logger.doneApplyingBuild(build)
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
