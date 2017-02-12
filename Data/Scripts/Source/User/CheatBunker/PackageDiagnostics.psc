Scriptname CheatBunker:PackageDiagnostics extends DynamicTerminal:Basic Conditional

CheatBunker:QuestScript Property CheatBunkerQuest Auto Const

CheatBunker:Package myPackage = None ; the package to act on

Bool bUsingBasePackage = false Conditional
Bool bValid = false Conditional
Bool bAIOPreventsUninstall = false Conditional

CheatBunker:Package Function getPackage()
	return myPackage
EndFunction

Function setPackage(CheatBunker:Package newPackage)
	myPackage = newPackage
	bUsingBasePackage = myPackage == CheatBunkerQuest.BasePackage
	bAIOPreventsUninstall = CheatBunkerQuest.AIOMode && myPackage.InAIO
	bValid = myPackage.isInstalled()
EndFunction

Function rerunInjections()
	CheatBunker:Package thisPackage = getPackage()
	if (thisPackage == None)
		CheatBunker:Logger:Package.nothingToProxy()
		return
	endif
	
	thisPackage.Injections.inject()
EndFunction

Function forceInjections()
	CheatBunker:Package thisPackage = getPackage()
	if (thisPackage == None)
		CheatBunker:Logger:Package.nothingToProxy()
		return
	endif
	
	thispackage.Injections.forceInject()
EndFunction

Function prepareUninstall()
	CheatBunker:Package thisPackage = getPackage()
	if (thisPackage == None)
		CheatBunker:Logger:Package.nothingToProxy()
		return
	endif

	CheatBunkerQuest.uninstallPackage(thisPackage)
EndFunction

Function tokenReplacementLogic()
	CheatBunker:Package thisPackage = getPackage()
	if (thisPackage == None)
		CheatBunker:Logger:Package.nothingToProxy()
		
		replace("PackageObject", None)
		replace("PackageVersion", None)
		replace("PackageDescription", None)
	else
		replace("PackageObject", thisPackage)
		replace("PackageVersion", thisPackage.DisplayVersion.VersionString)
		replace("PackageDescription", thisPackage.Description)
	endif
EndFunction
