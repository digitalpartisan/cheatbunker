Scriptname CheatBunker:QuestScript extends Chronicle:Engine Conditional
{This is a legacy script from prior to the Chronicle integration.  It served the purpose of the Engine as well as a few other catch-all needs, which is the reason the contents of this script seem all over the place.}

Group LegacyMetadata
	ReferenceAlias Property PlayerAlias Auto Const Mandatory
	FormList Property LegacyPackageList Auto Const Mandatory
EndGroup

Group ItemSpawning
	ObjectReference Property SpawnItemsContainer Auto Const Mandatory
	ObjectReference Property Workshop Auto Const Mandatory
EndGroup

; some filthy hacks to make the retrofit work
Bool bRetrofitNeeded = false ; is a retrofit needed (i.e. did the game load interceptor find the engine in the empty state?)
Bool bRetrofitComplete = false ; has this engine forced the packages installed in it to run all their updates again (i.e. making up for the fact that the stored version states could not be maintained from pre-Chronicle times)

Function setRetrofitNeeded()
	bRetrofitNeeded = true
EndFunction

Function setRetrofitComplete()
	bRetrofitComplete = true
EndFunction

Bool Function isRetrofitIncomplete()
	return bRetrofitNeeded && !bRetrofitComplete
EndFunction

Function retrofit()
{This is what happens when the engine is already running from an existing installation and the chronicle upgrade needs to be helped along (as opposed to the normal clean installation process.)}
	CheatBunker:Logger.logRetrofittingEngine()
	setRetrofitNeeded()
	
	Chronicle:Package:Core coreRef = getCorePackage()
	if (coreRef.IsRunning())
		CheatBunker:Logger.logRetrofittingPackage(coreRef)
		coreRef.Stop() ; make sure the core package can install properly
	endif
	
	; since this script is already running, perform the normal startup behavior
	observeComponents()
	GoToState("Setup")
EndFunction

Function retrofitPackages()
	Chronicle:Package:Container packageSet = getPackages()
	packages.rewind()
	Chronicle:Package packageRef = None
	Chronicle:Version:Static firstVersion = None
	
	while (packageSet.current())
		packageRef = packageSet.current()
		if (LegacyPackageList.HasForm(packageRef)) ; only retrofit the package if it was part of the legacy installation (otherwise, it installed normally and it's version state is known to be good)
			firstVersion = packageRef.getLowestVersion()
			CheatBunker:Logger.logRevertingPackageVersion(packageRef, firstVersion)
			packageRef.getCurrentVersion().setTo(firstVersion)
		endif
		packageSet.next()
	endWhile
EndFunction

Function gameLoaded()
	if (IsRunning() && "" == GetState()) ; if a game load is happening due to a legacy install, don't start the normal game load routine since the install is happening
		retrofit()
		return
	endif
	
	if (isRetrofitIncomplete())
		setRetrofitComplete()
		retrofitPackages()
	endif
	
	parent.gameLoaded()
EndFunction

Event Actor.OnPlayerLoadGame(Actor aActorRef)
{This is legacy code intended to handle part of the update from v1.1.0 to v1.2.0.
It exists because during that update, the checkForUpdates() call was moved to an alias script on this same quest.
Saves with the Cheat Bunker already present wouldn't have that alias filled in because the quest was already started and the load event would still come to this script.
Because this script receives the load event, it needs to call checkForUpdates() like the rest of the plugin was expecting, fill in the PlayerAlias so that it would get the game load events, and unregister for this event in the future.}
	Actor aPlayer = Game.GetPlayer()
	PlayerAlias.ForceRefTo(aPlayer)
	UnregisterForRemoteEvent(aPlayer, "OnPlayerLoadGame")
	
	gameLoaded()
EndEvent
