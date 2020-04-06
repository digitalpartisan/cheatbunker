Scriptname CheatBunker:WorldSpace extends Quest Conditional

Spawny:Spawner Property ButtonSpawner Auto Const Mandatory

Bool bIsReadyForTransit = false Conditional
String sStateInactive = "Inactive" Const
String sStateStarting = "Starting" Const
String sStateActivated = "Activated" Const

Function goToInactive()
    GoToState(sStateInactive)
EndFunction

Function goToStarting()
    GoToState(sStateStarting)
EndFunction

Function goToActivated()
    GoToState(sStateActivated)
EndFunction

Function transitTo()
	
EndFunction

Bool Function isReadyForTransit()
    return false
EndFunction

Spawny:Spawner Function getButtonSpawner()
	return ButtonSpawner
EndFunction

Function startBulk(CheatBunker:WorldSpace[] worldSpaces) Global
    if (!worldSpaces || !worldSpaces.Length)
        return
    endif

    Int iCounter = 0
    while (iCounter < worldSpaces.Length)
        worldSpaces[iCounter] && worldSpaces[iCounter].Start()
        iCounter += 1
    endWhile
EndFunction

Function stopBulk(CheatBunker:WorldSpace[] worldSpaces) Global
    if (!worldSpaces || !worldSpaces.Length)
        return
    endif

    Int iCounter = 0
    while (iCounter < worldSpaces.Length)
        worldSpaces[iCounter] && worldSpaces[iCounter].Stop()
        iCounter += 1
    endWhile
EndFunction

Event Spawny:Spawner.Spawned(Spawny:Spawner sender, Var[] args)

EndEvent

Auto State Inactive
    Event OnBeginState(String asOldState)
        bIsReadyForTransit = false
        CheatBunker:Dependencies:WorldSpaces.getInstance().unregisterWorldSpace(self)
		Spawny:Spawner mySpawner = getButtonSpawner()
		if (mySpawner)
			mySpawner.Stop()
		endif
    EndEvent

    Event OnQuestInit()
        goToStarting()
    EndEvent
EndState

State Starting
    Event OnBeginState(String asOldState)
		Spawny:Spawner mySpawner = getButtonSpawner()
		if (buttonSpawner)
			RegisterForCustomEvent(mySpawner, "Spawned")
			buttonSpawner.Start()
		else
			goToInactive()
		endif
    EndEvent

	Event OnEndState(String asNewState)
		UnregisterForCustomEvent(getButtonSpawner(), "Spawned")
	EndEvent

    Event OnQuestShutdown()
        goToInactive()
    EndEvent
	
	Event Spawny:Spawner.Spawned(Spawny:Spawner sender, Var[] args)
		if (getButtonSpawner() == sender)
			goToActivated()
		endif
	EndEvent
EndState

State Activated
    Event OnBeginState(String asOldState)
        CheatBunker:Dependencies:WorldSpaces.getInstance().registerWorldSpace(self)
        bIsReadyForTransit = true
    EndEvent

    Event OnQuestShutdown()
        goToInactive()
    EndEvent

    Bool Function isReadyForTransit()
        return true
    EndFunction
	
	Function transitTo()
		Spawny:Spawner mySpawner = getButtonSpawner()
		if (!mySpawner)
			Debug.MessageBox("no spawner")
			return
		endif
		
		CheatBunker:WorldSpace:EntranceButton button = mySpawner.getSpawnedReference() as CheatBunker:WorldSpace:EntranceButton
		if (!button)
			Debug.MessageBox("no button")
			return
		endif
		
		ObjectReference transitMarker = button.getMarker()
		if (!transitMarker)
			Debug.MessageBox("no marker")
			return
		endif
		
		CheatBunker:Dependencies:General.getInstance().getTransitQuest().transitToMarker(transitMarker)
	EndFunction
EndState
