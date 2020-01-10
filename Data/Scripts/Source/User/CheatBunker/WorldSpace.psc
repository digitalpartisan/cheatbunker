Scriptname CheatBunker:WorldSpace extends Quest Hidden Conditional

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

Function shutdownLogic()

EndFunction

Function startupLogic()

EndFunction

Function activateLogic()

EndFunction

Function transitTo()

EndFunction

Bool Function isReadyForTransit()
    return false
EndFunction

ObjectReference Function getButton()
    return None
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

Auto State Inactive
    Event OnBeginState(String asOldState)
        bIsReadyForTransit = false
        CheatBunker:Dependencies:WorldSpaces.getInstance().unregisterWorldSpace(self)
        shutdownLogic()
    EndEvent

    Event OnQuestInit()
        goToStarting()
    EndEvent
EndState

State Starting
    Event OnBeginState(String asOldState)
        startupLogic()
    EndEvent

    Event OnQuestShutdown()
        goToInactive()
    EndEvent
EndState

State Activated
    Event OnBeginState(String asOldState)
        CheatBunker:Dependencies:WorldSpaces.getInstance().registerWorldSpace(self)
        activateLogic()
        bIsReadyForTransit = true
    EndEvent

    Event OnQuestShutdown()
        goToInactive()
    EndEvent

    Bool Function isReadyForTransit()
        return true
    EndFunction
EndState
