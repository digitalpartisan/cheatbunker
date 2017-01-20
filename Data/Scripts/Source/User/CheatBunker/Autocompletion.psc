Scriptname CheatBunker:Autocompletion extends Quest Conditional

Bool Property CanHalt = false Auto Const

Bool bRunning = false Conditional
Bool bFinished = false Conditional
Bool bListeningForTrigger = false

Group AvailabilityTrigger
	Quest Property MyQuest Auto Const
	Int Property RequiredObjective Auto Const
	Int Property StageToWatch Auto Const
EndGroup

Group Messaging
	Message Property RunConditions Auto Const
	Message Property RunningMessage Auto Const
	Message Property FinishedMessage Auto Const
	Message Property HaltMessage Auto Const
	Message Property Description Auto Const
	Message Property SpecialInstructions Auto Const
	Message Property AvailabilityMessage Auto Const
EndGroup

Function logEvent(String sEvent)
	Debug.Trace("[CheatBunker][Autocompletion] " + sEvent + " " + self)
EndFunction

Bool Function isRunning()
	return bRunning
EndFunction

Bool Function isFinished()
	return bFinished
EndFunction

Bool Function isQuestReady()
	return MyQuest.IsRunning() && MyQuest.IsObjectiveDisplayed(RequiredObjective)
EndFunction

Bool Function hasWindowPassed()
	return isRunning() || isFinished() || MyQuest.IsCompleted() || MyQuest.IsObjectiveCompleted(RequiredObjective) ; once again, redundant, but w/e
EndFunction

Bool Function canRun()
{Override this with logic specific to your situation.}
	return !hasWindowPassed() && isQuestReady()
EndFunction

Bool Function canNoLongerRun()
{Override this with logic specific to your situation.}
	return hasWindowPassed()
EndFunction

Function runBehavior()
{Override this with logic specific to your situation.}
EndFunction

Bool Function run()
	if (!canRun())
		return false
	endif

	logEvent("running")
	bRunning = true
	RunningMessage.Show()
	runBehavior()
	
	return true
EndFunction

Bool Function canHalt()
	return isRunning() && CanHalt
EndFunction

Function haltBehavior()
{Override this with your own behavior should you need to.}
EndFunction

Bool Function halt()
	if (!canHalt())
		return false
	endif

	logEvent("halt")
	bRunning = false
	HaltMessage.Show()
	haltBehavior()
	
	return true
EndFunction

Bool Function canFinish()
	if (!isRunning())
		return false
	endif
	
	if (isFinished())
		return true
	endif
	
	return true
EndFunction

Function finishBehavior()
{Override this with your own behavior should you need to.}
EndFunction

Bool Function finish()
	if (!canFinish())
		return false
	endif
	
	logEvent("finishing")
	
	finishBehavior()
	
	FinishedMessage.Show()
	bRunning = false
	bFinished = true
EndFunction

Function listenForTrigger()
	if (bListeningForTrigger)
		return
	endif
	
	bListeningForTrigger = true
	RegisterForRemoteEvent(MyQuest, "OnStageSet")
EndFunction

Function stopListeningForTrigger()
	if (!bListeningForTrigger)
		return
	endif
	
	bListeningForTrigger = false
	UnregisterForRemoteEvent(MyQuest, "OnStageSet")
EndFunction

Event Quest.OnStageSet(Quest akSender, int auiStageID, int auiItemID)
	if (!bListeningForTrigger)
		return
	endif

	if (MyQuest == akSender && auiStageID == StageToWatch)
		Utility.Wait(5)
		AvailabilityMessage.Show()
		stopListeningForTrigger()
	endif
EndEvent

Function install()
	if (!hasWindowPassed())
		if (isQuestReady())
			AvailabilityMessage.Show()
		else
			listenForTrigger()
		endif
	endif
EndFunction

Function uninstall()
	stopListeningForTrigger()
EndFunction
