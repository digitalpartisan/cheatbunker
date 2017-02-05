Scriptname CheatBunker:SpawnPowerArmorScript extends Quest Conditional

CheatBunker:PowerArmorScript Property CheatBunkerPowerArmorBuilder Auto Const Mandatory
GlobalVariable Property CheatBunkerRemoveSpawnedFrameTimeLimit Auto Const Mandatory
Int Property TimerID = 1 Auto Const

Bool bTimerActive = false Conditional
ObjectReference akSpawnedFrame = None Conditional

Function startCountdown()
	StartTimer(CheatBunkerRemoveSpawnedFrameTimeLimit.GetValue(), TimerID)
	bTimerActive = true
EndFunction

Function endCountdown()
	CancelTimer(TimerID)

	bTimerActive = false
	akSpawnedFrame = None
EndFunction

Event OnTimer(Int aiTimerID)
	if (!bTimerActive)
		return
	endif

	bTimerActive = false
	akSpawnedFrame = None
EndEvent

Function despawnFrame()
	if (!bTimerActive)
		return
	endif

	akSpawnedFrame.Delete()
	endCountdown()
EndFunction

Function spawnFrame()
	if (bTimerActive)
		return
	endif

	akSpawnedFrame = Game.GetPlayer().PlaceAtMe(CheatBunkerPowerArmorBuilder.PowerArmorFrame)
	akSpawnedFrame.AddItem(CheatBunkerPowerArmorBuilder.FusionCore)
	startCountdown()
EndFunction
