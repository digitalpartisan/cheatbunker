Scriptname CheatBunker:CompanionScript extends Quest Conditional

CheatBunker:TransitScript Property CheatBunkerTransitQuest Auto Const
{So that companion movement gets the transit effects}
ReferenceAlias Property CompanionAlias Auto Const
{The current companion from the Followers quest}
ReferenceAlias Property DogmeatAlias Auto Const
{Dogmeat from the Followers quest - used when whether or not dogmeat is following the player matters}
ActorBase Property Dogmeat Auto Const
{The unique actor Dogmeat - used when the script needs to know about dogmeat regardless of whether or not he is following the player}

Group Tracking
	Quest Property CheatBunkerCompanionQuest Auto Const
	ReferenceAlias Property TrackingAlias Auto Const
	{The companion being tracked by the CheatBunkerCompanionQuest}
	Int Property TrackingObjective = 10 Auto Const
	Message Property TrackingNotAvailableMessage Auto Const
	Message Property NoCompanionMessage Auto Const
	Message Property NoDogmeatMessage Auto Const
EndGroup

Group Affinity
	Message Property AffinityRelationshipNotDamaged Auto Const
	Message Property AffinityRelationshipReset Auto Const
	Message Property AffinityNoCompanion Auto Const
	Message Property AffinityNoProgressPossible Auto Const
	Message Property AffinityRelationshipProgress Auto Const
	Message Property AffinityNotACompanion Auto Const
	GlobalVariable Property DamagedAffinityThreshold Auto Const
EndGroup

Bool bTracking = false Conditional

Actor Function getCompanionActor()
	return CompanionAlias.getActorReference()
EndFunction

Actor Function getDogmeatActor()
	return DogmeatAlias.getActorReference()
EndFunction

Bool Function isRelationshipDamaged(CheatBunker:Companion companion)
	CompanionActorScript companionActor = companion.getCompanionActor()
	if (None == companionActor)
		return false
	else
		Float fAffinity = companionActor.GetValue(Game.GetCommonProperties().CA_Affinity)
		Float fThreshold = DamagedAffinityThreshold.GetValue()
		Debug.Trace("[CheatBunker][DamagedRelationshipCheck] Affinity is " + fAffinity + " and threshold is " + fThreshold + " for companion " + companion)
		return fAffinity < fThreshold
	endif
EndFunction

Function resetCompanionRelationship(CheatBunker:Companion companion)
	if (!isRelationshipDamaged(companion))
		AffinityRelationshipNotDamaged.Show()
		return
	endif

	CompanionActorScript companionActor = companion.getCompanionActor()
	companionActor.UnsetHasLeftPlayerPermanently()
	CompanionActor.SetAffinity(DamagedAffinityThreshold.GetValue())
	AffinityRelationshipReset.Show()
EndFunction

Function progressRelationship(Actor aTarget)
	CompanionActorScript aCompanion = aTarget as CompanionActorScript
	if (aCompanion == None)
		AffinityNoCompanion.Show()
		return
	endif

	CompanionActorScript:ThresholdData nextThreshold = aCompanion.GetNextThreshold(true)
	if (nextThreshold == None)
		AffinityNoProgressPossible.Show()
		return
	endif

	aCompanion.SetAffinity(nextThreshold.Threshold_Global.GetValue())
	AffinityRelationshipProgress.Show()
EndFunction

Function progressCompanionRelationship()
	progressRelationship(getCompanionActor())
EndFunction

Function stopTracking()
	CheatBunkerCompanionQuest.SetActive(false)
	CheatBunkerCompanionQuest.SetObjectiveDisplayed(TrackingObjective, false)
	TrackingAlias.Clear()
	bTracking = false
EndFunction

Function setTrackingTarget(Actor aTarget, Message NotAvailableMessage = None)
	if (aTarget == None)
		if (NotAvailableMessage == None)
			TrackingNotAvailableMessage.Show()
		else
			NotAvailableMessage.Show()
		endif

		return
	endif

	stopTracking()
	
	TrackingAlias.forceRefTo(aTarget)
	CheatBunkerCompanionQuest.SetObjectiveDisplayed(TrackingObjective, true)
	CheatBunkerCompanionQuest.SetActive(true)
	bTracking = true
EndFunction

Function moveToPlayer(Actor aTarget, Message mFailure = None)
	if (aTarget == None)
		if (mFailure != None)
			mFailure.Show()
		endif
		return
	endif
	
	Debug.Trace("[CheatBunker][Companion] attempting to move actor to player: " + aTarget)
	CheatBunkerTransitQuest.transitToPlayer(aTarget)
EndFunction

Function trackCompanion()
	setTrackingTarget(getCompanionActor(), NoCompanionMessage)
EndFunction

Function moveCompanionToPlayer()
	MoveToPlayer(getCompanionActor(), NoCompanionMessage)
EndFunction

Function trackDogmeat()
	setTrackingTarget(Dogmeat.getUniqueActor(), NoDogmeatMessage)
EndFunction

Function moveDogmeatToPlayer()
	moveToPlayer(Dogmeat.getUniqueActor(), NoDogmeatMessage)
EndFunction

Event OnQuestInit()
	Debug.Trace("[CheatBunker][CompanionQuest] starting up")
EndEvent

Event OnQuestShutdown()
	Debug.Trace("[CheatBunker][CompanionQuest] shutting down")
EndEvent
