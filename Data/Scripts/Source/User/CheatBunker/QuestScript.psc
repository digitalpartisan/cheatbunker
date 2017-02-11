Scriptname CheatBunker:QuestScript extends Quest Conditional

Group Metadata
	Quest Property CheatBunkerQuest Auto Const Mandatory
	ReferenceAlias Property PlayerAlias Auto Const Mandatory
	Bool Property AIOMode = False Auto Const
EndGroup

Group PackagesAndPackageSupport
	FormList Property Packages Auto Const Mandatory
	FormList Property Importers Auto Const Mandatory
	FormList Property Autocompletions Auto Const Mandatory
	
	CheatBunker:Package Property BasePackage Auto Const Mandatory
	
	Message Property UpdatesRunMessage Auto Const Mandatory
	GlobalVariable Property PackageInitMessageDelay Auto Const Mandatory

	FormList Property CheatBunkerUninstallQuests Auto Const Mandatory
EndGroup

Group ItemSpawning
	ObjectReference Property SpawnItemsContainer Auto Const Mandatory
	ObjectReference Property SpawnItemsMarker Auto Const Mandatory
	ObjectReference Property SpawnWeaponMarker Auto Const Mandatory
	ObjectReference Property Workshop Auto Const Mandatory
EndGroup

Event OnQuestInit()
	Debug.Trace("[CheatBunker][Quest] starting up")
	installPackage(BasePackage)
EndEvent

Event OnQuestShutdown()
	Debug.Trace("[CheatBunker][Quest] shutting down")
EndEvent

CheatBunker:Package Function getPackage(Int iIndex)
	CheatBunker:Package thisPackage = Packages.GetAt(iIndex) as CheatBunker:Package
	if (None == thisPackage)
		Debug.Trace("[CheatBunker] found no package at index " + iIndex + " in package list of size " + Packages.GetSize())
	endif
	return thisPackage
EndFunction

Function installPackage(CheatBunker:Package newPackage)
	if (newPackage.install())
		Packages.AddForm(newPackage)
	endif
EndFunction

Function uninstallPackage(CheatBunker:Package packageToRemove)
	packageToRemove.prepareUninstall()
	Packages.RemoveAddedForm(packageToRemove)
EndFunction

Function uninstall()
	Debug.Trace("[CheatBunker] uninstalling all packages and prepping for mod removal")
	Int iCounter = 0
	Int iSize = Packages.GetSize()
	While(iCounter < iSize)
		uninstallPackage(getPackage(iSize - iCounter- 1)) ; do these in the opposite order they were installed out of caution so that the base package is last
		iCounter += 1
	EndWhile
	
	iCounter = 0
	iSize = CheatBunkerUninstallQuests.GetSize()
	While (iCounter < iSize)
		(CheatBunkerUninstallQuests.GetAt(iCounter) as Quest).Stop()
		iCounter += 1
	EndWhile
EndFunction

Function checkForUpdates()
	Bool bUpdateRun = false

	Int iCounter = 0
	Int iSize = Packages.GetSize()
	While (iCounter < iSize)
		CheatBunker:Package thisPackage = getPackage(iCounter)
		if ( !thisPackage.isCurrent() && thisPackage.update() ) ; running unneeded updates will trigger stack traces, don't do it
			bUpdateRun = true
		endif
		iCounter += 1
	EndWhile

	if (bUpdateRun)
		Debug.Trace("[CheatBunker] updates ran")
		Utility.Wait(PackageInitMessageDelay.GetValue())
		UpdatesRunMessage.Show()
	else
		Debug.Trace("[CheatBunker] no updates ran")
	endif
EndFunction

Function registerImporter(CheatBunker:Importer newImporter)
	if (Importers.HasForm(newImporter))
		return
	endif

	Importers.AddForm(newImporter)
	newImporter.Injections.inject()
EndFunction

Function deregisterImporter(CheatBunker:Importer importer)
	if (Importers.HasForm(importer))
		Importers.RemoveAddedForm(importer)
		importer.Injections.revert()
	endif
EndFunction

Function installAutocompletion(CheatBunker:Autocompletion autocompletion)
	if (Autocompletions.HasForm(autocompletion))
		return
	endif
	
	Autocompletions.AddForm(autocompletion)
	autocompletion.install()
EndFunction

Function uninstallAutocompletion(CheatBunker:Autocompletion autocompletion)
	if (Autocompletions.HasForm(autocompletion))
		Autocompletions.RemoveAddedForm(autocompletion)
		autocompletion.uninstall()
	endif
EndFunction

Event Actor.OnPlayerLoadGame(Actor aActorRef)
{This is legacy code intended to handle part of the update from version 1.1.0 to version 1.2.0.
It exists because during that update, the checkForUpdates() call was moved to an alias script on this same quest.
Saves with the Cheat Bunker already present wouldn't have that alias filled in because the quest was already started and the load event would still come to this script.
Because this script receives the load event, it needs to call checkForUpdates() like the rest of the plugin was expecting, fill in the PlayerAlias so that it would get the game load events, and unregister for this event in the future.}
	Debug.Trace("[CheatBunker] legacy version called " + self + " with game load event")

	checkForUpdates()

	Actor aPlayer = Game.GetPlayer()
	PlayerAlias.ForceRefTo(aPlayer)
	UnregisterForRemoteEvent(aPlayer, "OnPlayerLoadGame")
EndEvent

