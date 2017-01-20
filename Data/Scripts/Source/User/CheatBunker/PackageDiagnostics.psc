Scriptname CheatBunker:PackageDiagnostics extends DynamicTerminal:Basic Conditional

CheatBunker:QuestScript Property CheatBunkerQuest Auto Const

CheatBunker:Package myPackage = None ; the package to act on

Bool bUsingBasePackage = false Conditional
Bool bValid = false Conditional

CheatBunker:Package Function getPackage()
	return myPackage
EndFunction

Function setPackage(CheatBunker:Package newPackage)
	myPackage = newPackage
	bUsingBasePackage = myPackage == CheatBunkerQuest.BasePackage
	bValid = myPackage.isInstalled()
	Debug.Trace("[CheatBunker][Diagnostics] set " + myPackage.toString())
EndFunction

Function logNoPackage(String sTask)
	Debug.TraceStack("[CheatBunker][Diagnostics] no package specified, cannot " + sTask)
EndFunction

Function logAction(String sAction)
	Debug.Trace("[CheatBunker][Diagnostics] " + sAction + ": " + getPackage())
EndFunction

Function rerunInjections()
	CheatBunker:Package thisPackage = getPackage()
	if (thisPackage == None)
		logNoPackage("rerun injections")
		return
	endif
	
	logAction("rerunning injections")
	thisPackage.Injections.inject()
EndFunction

Function forceInjections()
	CheatBunker:Package thisPackage = getPackage()
	if (thisPackage == None)
		logNoPackage("force injections")
		return
	endif
	
	logAction("rerunning injections")
	thispackage.Injections.forceInject()
EndFunction

Function prepareUninstall()
	CheatBunker:Package thisPackage = getPackage()
	if (thisPackage == None)
		logNoPackage("prepare uninstall")
		return
	endif

	logAction("prep uninstall")
	CheatBunkerQuest.uninstallPackage(thisPackage)
EndFunction

Function tokenReplacementLogic()
	CheatBunker:Package thisPackage = getPackage()
	if (thisPackage == None)
		logNoPackage("token replacement")
		return
	endif

	replace("PackageObject", thisPackage)
	replace("PackageVersion", thisPackage.DisplayVersion.VersionString)
	replace("PackageDescription", thisPackage.Description)
EndFunction
