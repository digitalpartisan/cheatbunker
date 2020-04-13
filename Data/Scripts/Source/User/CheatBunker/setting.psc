Scriptname CheatBunker:Setting extends Quest Hidden Conditional

Chronicle:Package Property MyPackage Auto Const Mandatory
Message Property Explanation Auto Const Mandatory

Bool bIsActivated = false Conditional

String sStateDeactivated = "Deactivated" Const
String sStateActivated = "Activated" Const

Chronicle:Package Function getPackage()
	return MyPackage
EndFunction

Function goToDeactivated()
	GoToState(sStateDeactivated)
EndFunction

Function goToActivated()
	GoToState(sStateActivated)
EndFunction

Bool Function isActivated()
	return false
EndFunction

Message Function getExplanation()
    return Explanation
EndFunction

Function startupLogic()

EndFunction

Function shutdownLogic()

EndFunction

Function loadLogic()

EndFunction

Event Actor.OnPlayerLoadGame(Actor akSender)
	
EndEvent

Function stopBulk(CheatBunker:Setting[] settings) Global
    if (!settings || !settings.Length)
        return
    endif

    Int iCounter = 0
    while (iCounter < settings.Length)
        if (settings[iCounter])
            settings[iCounter].Stop()
        endif

        iCounter += 1
    endWhile
EndFunction

Function stopList(FormList settingList) Global
    stopBulk(Jiffy:Utility:FormList.toArray(settingList) as CheatBunker:Setting[])
EndFunction

Auto State Deactivated
	Event OnBeginState(String asOldState)
	    CheatBunker:Logger:Settings.logDeactivating(self)
		bIsActivated = false
		shutdownLogic()
		UnregisterForRemoteEvent(Game.GetPlayer(), "OnPlayerLoadGame")
	EndEvent
	
	Event OnQuestInit()
		goToActivated()
	EndEvent
EndState

State Activated
	Event OnBeginState(String asOldState)
	    if (sStateDeactivated != asOldState)
	        return ; if a child script implements a state that occurs temporarily during an "active" state, do not re-execute the activation logic
	    endif

	    CheatBunker:Logger:Settings.logActivating(self)
		bIsActivated = true
		startupLogic()
		RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerLoadGame")
	EndEvent
	
	Event OnQuestShutdown()
		goToDeactivated()
	EndEvent
	
	Event Actor.OnPlayerLoadGame(Actor akSender)
		if (Game.GetPlayer() != akSender)
			return
		endif

		CheatBunker:Logger:Settings.logLoadEvent(self)
		loadLogic()
	EndEvent
	
	Bool Function isActivated()
		return true
	EndFunction
EndState
