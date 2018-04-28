Scriptname CheatBunker:QuestScript extends Chronicle:Engine Conditional

Group LegacyMetadata
	ReferenceAlias Property PlayerAlias Auto Const Mandatory
	FormList Property LegacyPackageList Auto Const Mandatory
EndGroup

Group ItemSpawning
	ObjectReference Property SpawnItemsContainer Auto Const Mandatory
	ObjectReference Property Workshop Auto Const Mandatory
EndGroup

Function retrofitPackage(Chronicle:Package packageRef)
	getPackages().addPackage(packageRef)
	packageRef.GoToState("Idle")
EndFunction

Function retrofitPackages()
	Int iCounter = 0
	Int iSize = LegacyPackageList.GetSize()
	while (iCounter < iSize)
		retrofitPackage(LegacyPackageList.GetAt(iCounter) as Chronicle:Package)
		iCounter += 1
	endWhile
EndFunction

Function chronicleRetrofit()
	retrofitPackages()
	observeComponents()
	getInstaller().GoToState("Retrofit")
	initializeInstaller()
	GoToState("Active")
EndFunction

Function gameLoaded()
	if ("" == GetState())
		chronicleRetrofit()
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
