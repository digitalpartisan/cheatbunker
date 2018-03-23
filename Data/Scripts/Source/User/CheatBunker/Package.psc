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
	CheatBunker:Version:Stored Property StoredVersion Auto Const Mandatory
	{This value is the actual version of the package at runtime.  Its values are preserved in the save file so that updated packages can be detected when a save is loaded.}
	CheatBunker:Version:Display Property DisplayVersion = None Auto Const
	{This property is a relic from the past where (for some stupid reason) the static value forms did not have their version value as their name.  It's sticking around so that packages not yet upgraded can still function in the bunker.  Should be cleared out to None.}
	CheatBunker:Version:Static Property VersionSetting Auto Const
	{This version is used to detect updates to the package.  Incrememting the values in this version object will cause an update cycle to run.}
EndGroup

Bool Function isInstalled()
	if (StoredVersion == None)
		return false
	endif

	return StoredVersion.validate()
EndFunction

Bool Function isVersionLogicUpgraded()
{Returns true if the use of the CheatBunker:Version:Display script has been abandoned and the VersionSetting property has been populated to replace the deprecated display version.}
	return None != VersionSetting
EndFunction

CheatBunker:Version Function getVersionSetting()
	if (isVersionLogicUpgraded())
		return VersionSetting
	endif
	
	if (None == DisplayVersion || None == DisplayVersion.VersionData)
		return None
	else
		return DisplayVersion.VersionData
	endif
	
	return None
EndFunction

Form Function getVersionForDisplay()
{Returns a form which will have a name matching the version value to be displayed}
	if (isVersionLogicUpgraded())
		return VersionSetting
	else
		if (None == DisplayVersion)
			return None ; just being careful
		else
			return DisplayVersion.VersionString
		endif
	endif
EndFunction

Bool Function isCurrent()
	if (!isInstalled())
		return false
	endif

	CheatBunker:Version currentSetting = getVersionSetting()
	if (None == currentSetting || !currentSetting.validate())
		return true ; technically accurate since there's no way to proceed with becoming current
	endif

	if (StoredVersion.greaterThan(currentSetting)) ; true, but U DID WOT, M8?
		CheatBunker:Logger:Package.internalVersionError(self) ; cannot upgrade to a previous version
		return true
	endif

	return !StoredVersion.lessThan(currentSetting) ; true if the setting is greater than the stored version
EndFunction

Function handleImporters(Bool bRun = true)
	if (Importers == None)
		return
	endif

	Int iCounter = 0
	Int iSize = Importers.GetSize()
	CheatBunker:Importer targetImporter = None
	While (iCounter < iSize)
		targetImporter = Importers.GetAt(iCounter) as CheatBunker:Importer
		if (bRun)
			targetImporter.Injections.inject()
		else
			targetImporter.Injections.revert()
		endif
		iCounter += 1
	EndWhile
EndFunction

Function runImporters()
	handleImporters()
EndFunction

Function revertImporters()
	handleImporters(false)
EndFunction

Function handleAutocompletions(Bool bInitialize = true)
	if (Autocompletions == None)
		return
	endif
	
	Int iCounter = 0
	Int iSize = Autocompletions.GetSize()
	CheatBunker:Autocompletion targetAutocompletion = None
	While (iCounter < iSize)
		targetAutocompletion = Autocompletions.GetAt(iCounter) as CheatBunker:Autocompletion
		if (bInitialize)
			targetAutocompletion.initialize()
		else
			targetAutocompletion.terminate()
		endif
		iCounter += 1
	EndWhile
EndFunction

Function initializeAutocompletions()
	handleAutocompletions()
EndFunction

Function terminateAutocompletions()
	handleAutocompletions(false)
EndFunction

Function postInstallationBehavior()
{Override this to implement custom behavior to handle any custom requirements of your package's installation.}
EndFunction

Bool Function canInstall()
	if (isInstalled())
		CheatBunker:Logger:Package.alreadyInstalled(self)
		return false
	endif

	CheatBunker:Version currentSetting = getVersionSetting()
	if (None == currentSetting || !currentSetting.validate())
		return false
	endif

	return true
EndFunction

Bool Function install()
	if (!canInstall())
		return false
	endif

	CheatBunker:Logger:Package.install(self)
	
	Injections.inject()
	runImporters()
	initializeAutocompletions()
	InstallationMessage.Show()
	
	postInstallationBehavior()

	StoredVersion.setTo(getVersionSetting())
	
	return true
EndFunction

Bool Function canUpdate()
	if (!isInstalled())
		return false
	endif

	if (isCurrent())
		return false
	endif

	return true
EndFunction

Bool Function isUpdateRelevant(CheatBunker:PackageUpdater updater)
	if (!updater.validate()) ; paranoia, but clearly, the right thing to do
		return false
	endif

	CheatBunker:Version currentSetting = getVersionSetting()
	if (currentSetting.lessThan(updater.FromVersion) || currentSetting.lessThan(updater.ToVersion)) ; the updater wants to upgrade from and/or to a version that doesn't even exist
		return false
	endif

	return (!updater.FromVersion.lessThan(StoredVersion)); updates for versions prior to the current version should be ignored.
EndFunction

Bool Function shouldRunUpdate(CheatBunker:PackageUpdater updater)
	if (isUpdateRelevant(updater) && StoredVersion.equals(updater.FromVersion))
		return true
	else
		CheatBunker:Logger:Package.notRunningUpdate(self, updater)
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
	
	CheatBunker:Logger:Package.updateDetected(self)
	runUpdaters()
	Injections.inject() ; this is soft behavior and won't do a whole lot other than run injections which haven't been run yet, not in postLoadBehavior() because injections are only added during updates

	StoredVersion.setTo(getVersionSetting()) ; regardless of what version we're at after running the updaters, this package needs to fully update so that update cycles don't kick off for no reason

	return true
EndFunction

Function postLoadBehavior()
	CheatBunker:Logger:Package.runningPostLoadBehavior(self)
	
	runImporters() ; soft behavior, already-run importers won't rerun their injections thanks to Inject-Tec
	initializeAutocompletions() ; soft behavior, already-initialized autocompletions won't be re-initialized
EndFunction

Function customUninstallBehavior()
{Override this to handle any custom behavior your package may need to execute in preparation of uninstallation.}
EndFunction

Function prepareUninstall()
	if (!isInstalled())
		return
	endif
	
	CheatBunker:Logger:Package.uninstall(self)
	
	Injections.revert()
	revertImporters()
	terminateAutocompletions()
	
	customUninstallBehavior()
	
	StoredVersion.invalidate()
EndFunction

Event OnQuestInit()
	CheatBunkerQuest.installPackage(self)
EndEvent

String Function toString()
	return "package " + self + " (" + StoredVersion.toString() + ")"
EndFunction
