Scriptname CheatBunker:QuestScript extends Quest Conditional

Holotape Property CheatBunkerHolotape Auto Const

Group Packages
	FormList Property Packages Auto Const
	CheatBunker:Package Property BasePackage Auto Const
	Message Property UpdatesRunMessage Auto Const
	GlobalVariable Property PackageInitMessageDelay Auto Const
EndGroup

Group Importers
	FormList Property Importers Auto Const
EndGroup

Group Autocompletions
	FormList Property Autocompletions Auto Const
EndGroup

Group ItemSpawning
	ObjectReference Property SpawnItemsContainer Auto Const
	ObjectReference Property SpawnItemsMarker Auto Const
	ObjectReference Property SpawnWeaponMarker Auto Const
	ObjectReference Property WorkbenchContainer Auto Const
EndGroup

Group IntroQuestSettings
	Quest Property OutOfTimeQuest Auto Const
	Quest Property CheatBunkerIntroQuest Auto Const
	Int Property ExitVaultObjective Auto Const
	Int Property GoHomeStage Auto Const
	
	Quest Property CheatBunkerQuest Auto Const
	Int Property HoldingStage = 20 Auto Const

	GlobalVariable Property PostVaultDelay Auto Const
EndGroup

Function init()
	RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerLoadGame") ; game loading should trigger attempts to update packages, so hook the event
	introQuestSetup()
	installPackage(BasePackage)
	CheatBunkerQuest.SetStage(HoldingStage)
EndFunction

Function giveHolotape()
	Game.GetPlayer().AddItem(CheatBunkerHolotape)
EndFunction

Function introQuestSetup()
	if (OutOfTimeQuest.IsObjectiveCompleted(ExitVaultObjective))
		CheatBunkerIntroQuest.Start()
	else
		RegisterForRemoteEvent(OutOfTimeQuest, "OnStageSet")
	endif
EndFunction

Int Function getNumPackages()
	return Packages.GetSize()
EndFunction

CheatBunker:Package Function getPackage(Int iIndex)
	CheatBunker:Package thisPackage = Packages.GetAt(iIndex) as CheatBunker:Package
	if (None == thisPackage)
		Debug.Trace("[CheatBunker] found no package at index " + iIndex + " in package list of size " + getNumPackages())
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
	
	UnregisterForRemoteEvent(Game.GetPlayer(), "OnPlayerLoadGame") ; make sure this stops or else we're sloppily leaving listeners lying around
EndFunction

Function runUpdates()
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
		Utility.Wait(PackageInitMessageDelay.GetValue())
		UpdatesRunMessage.Show()
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

Event Quest.OnStageSet(Quest akSender, int auiStageID, int auiItemID)
	if (OutOfTimeQuest == akSender && auiStageID == GoHomeStage)
		Utility.Wait(PostVaultDelay.GetValue()) ; So that we're not competing with the main quest for UI space
		CheatBunkerIntroQuest.Start()
		UnregisterForRemoteEvent(OutOfTimeQuest, "OnStageSet")
	endif
EndEvent

Event Actor.OnPlayerLoadGame(Actor aActorRef)
	runUpdates()
EndEvent
