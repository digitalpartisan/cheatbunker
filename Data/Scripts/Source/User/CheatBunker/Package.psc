Scriptname CheatBunker:Package extends Quest Conditional

CheatBunker:QuestScript Property CheatBunkerQuest Auto Const
InjectTec:Injector:Bulk Property Injections  Auto Const
{Injections required to make the CheatBunker and it's optional packages work as expected}
FormList Property Importers Auto Const
{These need to be treated as individual items unlike injections, so they're not bundled in a convenient object}
FormList Property Updaters Auto Const
{This is a FormList which contains CheatBunker:PackageUpdater objects because they're easier to manipulate in the editor than Array properties.  Updates must be one per version number and they must be in order in the FormList.
Updates will be run if their ToVersion matches the StoredVersion of this package.  Running an Update will cause the StoredVersion of this package to match the update's ToVersion property.
Chaining updates is possible if the ToVersion of one matches the FromVersion of the next update in the FormList.  If this package's StoredVersion is never made to match that of an update's FromVersion, that update will never run.}
FormList Property Autocompletions Auto Const
{These aren't injections as such because they actually have event listeners that need to be manually started and stopped if they're running and a package is uninstalled.}

Bool Property InAIO = false Auto Const
{Setting this value to true will prevent this package from being uninstalled in the diagnostics terminal if the plugin is in all-in-one mode.}

Group Metadata
	Message Property InstallationMessage Auto Const
	{Displayed when the package is first installed}
	Message Property Description Auto Const
	{Detailed information to be displayed at the request of the user by way of diagnostics terminal}
EndGroup

Group Versions
	CheatBunker:Version:Stored Property StoredVersion Auto Const
	{This value is the actual version of the package at runtime.  Its values are preserved in the save file so that updated packages can be detected when a save is loaded.}
	CheatBunker:Version:Display Property DisplayVersion Auto Const
	{In addition to containing the message used to display the version in the package details terminal, this version is used to detect updates to the package.  Incrememting the values in this version object will cause an update cycle to run.}
EndGroup

Bool Function isInstalled()
	if (StoredVersion == None)
		return false
	endif

	return StoredVersion.validate()
EndFunction

Bool Function isCurrent()
	if (!isInstalled())
		return false
	endif

	if (DisplayVersion == None || DisplayVersion.VersionData == None || !DisplayVersion.VersionData.validate())
		return true ; technically accurate since there's no way to proceed with becoming current
	endif

	if (StoredVersion.greaterThan(DisplayVersion.VersionData)) ; true, but U DID WOT, M8?
		Debug.Trace("[CheatBunker][Package] " + self + " stored version greater than display version")
		return true
	endif

	return !StoredVersion.lessThan(DisplayVersion.VersionData)
EndFunction

Function registerImporters()
	if (Importers == None)
		return
	endif

	Int iCounter = 0
	Int iSize = Importers.GetSize()
	While (iCounter < iSize)
		CheatBunkerQuest.registerImporter(Importers.GetAt(iCounter) as CheatBunker:Importer)
		iCounter += 1
	EndWhile
EndFunction

Function deregisterImporters()
	if (Importers == None)
		return
	endif

	Int iCounter = 0
	Int iSize = Importers.GetSize()
	While (iCounter < iSize)
		CheatBunkerQuest.deregisterImporter(Importers.GetAt(iCounter) as CheatBunker:Importer)
		iCounter += 1
	EndWhile
EndFunction

Function installAutocompletions()
	if (Autocompletions == None)
		return
	endif

	Int iCounter = 0
	Int iSize = Autocompletions.GetSize()
	While (iCounter < iSize)
		CheatBunkerQuest.installAutocompletion(Autocompletions.GetAt(iCounter) as CheatBunker:Autocompletion)
		iCounter += 1
	EndWhile
EndFunction

Function uninstallAutocompletions()
	if (Autocompletions == None)
		return
	endif

	Int iCounter = 0
	Int iSize = Autocompletions.GetSize()
	While (iCounter < iSize)
		CheatBunkerQuest.uninstallAutocompletion(Autocompletions.GetAt(iCounter) as CheatBunker:Autocompletion)
		iCounter += 1
	EndWhile
EndFunction

Function postInstallationBehavior()
{Override this to implement custom behavior to handle any custom requirements of your package's installation.}
EndFunction

Bool Function canInstall()
	if (isInstalled())
		return false
	endif

	if (DisplayVersion == None || DisplayVersion.VersionData == None || !DisplayVersion.VersionData.validate())
		return false
	endif

	return true
EndFunction

Bool Function install()
	if (!canInstall())
		return false
	endif

	Injections.inject()
	registerImporters()
	installAutocompletions()
	Utility.Wait(CheatBunkerQuest.PackageInitMessageDelay.GetValue()) ; So that we don't miss the message displaying in the UI
	InstallationMessage.Show()
	postInstallationBehavior()

	StoredVersion.setTo(DisplayVersion.VersionData)
	
	return true
EndFunction

Bool Function canUpdate()
	if (!isInstalled())
		return false
	endif

	if (isCurrent()) ; this call encompasses all sorts of hinky issues with the DisplayVersion that would inhibit an upgrade
		return false
	endif

	return true
EndFunction

Bool Function isUpdateRelevant(CheatBunker:PackageUpdater updater)
	if (!updater.validate()) ; paranoia, but clearly, the right thing to do
		return false
	endif

	if (DisplayVersion.VersionData.lessThan(updater.FromVersion) || DisplayVersion.VersionData.lessThan(updater.ToVersion)) ; the updater wants to upgrade from and/or to a version that doesn't even exist
		return false
	endif

	return (!updater.FromVersion.lessThan(StoredVersion)); updates for versions prior to the current version should be ignored.
EndFunction

Bool Function shouldRunUpdate(CheatBunker:PackageUpdater updater)
	if (isUpdateRelevant(updater) && StoredVersion.equals(updater.FromVersion))
		return true
	else
		Debug.Trace("[CheatBunker][Package] " + toString() + " decided not to run " + updater.toString())
		return false
	endif
EndFunction

Function runUpdaters()
	if (Updaters == None)
		return
	endif

	Int iCounter = 0
	Int iUpdates = Updaters.GetSize()
	While (iCounter < iUpdates)
		CheatBunker:PackageUpdater updater = Updaters.GetAt(iCounter) as CheatBunker:PackageUpdater
		if (shouldRunUpdate(updater))
			updater.run()
			StoredVersion.setTo(updater.ToVersion)
		endif
		iCounter += 1
	EndWhile
EndFunction

Bool Function update()
	if (!canUpdate())
		return false
	endif
	
	Debug.Trace("[CheatBunker][Package] " + toString() + " detected update to " + DisplayVersion.VersionData.toString())
	Injections.inject() ; this is soft behavior and won't do a whole lot other than run injections which haven't been run yet
	registerImporters() ; this is also soft behavior and won't double-add an existing injector or run injections which have already been run
	installAutocompletions() ; yet more "soft" behavior.  autocompletions won't be repeatedly added to the list
	runUpdaters()

	StoredVersion.setTo(DisplayVersion.VersionData) ; regardless of what version we're at after running the updaters, this package needs to fully update so that update cycles don't kick off for no reason

	return true
EndFunction

Function customUninstallBehavior()
{Override this to handle any custom behavior your package may need to execute in preparation of uninstallation.}
EndFunction

Function prepareUninstall()
	if (!isInstalled())
		return
	endif
	
	Injections.revert()
	deregisterImporters()
	uninstallAutocompletions()
	customUninstallBehavior()
	StoredVersion.invalidate()
EndFunction

Event OnQuestInit()
	CheatBunkerQuest.installPackage(self)
EndEvent

String Function toString()
	return "package " + self + " (" + StoredVersion.toString() + ")"
EndFunction
