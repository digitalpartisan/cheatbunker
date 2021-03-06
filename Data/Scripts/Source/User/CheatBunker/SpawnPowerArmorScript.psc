Scriptname CheatBunker:SpawnPowerArmorScript extends Quest Conditional

GlobalVariable Property CheatBunkerRemoveSpawnedFrameTimeLimit Auto Const Mandatory
Int Property TimerID = 1 Auto Const

Bool bTimerActive = false Conditional
ObjectReference spawnedFrame = None Conditional

Function startCountdown()
	StartTimer(CheatBunkerRemoveSpawnedFrameTimeLimit.GetValue(), TimerID)
	listenToFrame()
	bTimerActive = true
EndFunction

Function listenToFrame()
	RegisterForRemoteEvent(spawnedFrame, "OnActivate")
EndFunction

Function stopListeningToFrame()
	UnregisterForRemoteEvent(spawnedFrame, "OnActivate")
EndFunction

Function endCountdown()
	CancelTimer(TimerID)

	stopListeningToFrame()
	bTimerActive = false
	spawnedFrame = None
EndFunction

Event OnTimer(Int aiTimerID)
	if (!bTimerActive)
		return
	endif

	stopListeningToFrame()
	bTimerActive = false
	spawnedFrame = None
EndEvent

Function despawnFrame()
	if (!bTimerActive)
		return
	endif

	stopListeningToFrame()
	spawnedFrame.Delete()
	endCountdown()
EndFunction

Function spawnFrame()
	if (bTimerActive)
		return
	endif

	CheatBunker:Dependencies:Spawning spawningDependencies = CheatBunker:Dependencies:Spawning.getInstance()
	spawnedFrame = Game.GetPlayer().PlaceAtMe(spawningDependencies.getPowerArmorFrame())
	spawnedFrame.AddItem(spawningDependencies.getFusionCore())
	spawnedFrame.SetAngle(0, 0, spawnedFrame.GetAngleZ()) ; make sure the new frame isn't tilted so that it is usable
	
	startCountdown()
EndFunction

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
	if (akSender == spawnedFrame)
		endCountdown()
	endif
EndEvent
