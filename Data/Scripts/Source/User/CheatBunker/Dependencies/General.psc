Scriptname CheatBunker:Dependencies:General extends Quest Const

InjectTec:Injector:Bulk:ChronicleBehavior:Search Property CheatBunkerPackageBehaviorSearchInjections Auto Const Mandatory
InjectTec:Integrator:ChronicleBehavior:Search Property CheatBunkerPackageBehaviorSearchImporters Auto Const Mandatory
CheatBunker:Setting:PackageBehavior:Search Property CheatBunkerPackageBehaviorSearchSettings Auto Const Mandatory
CheatBunker:Autocompletion:PackageBehavior:Search Property CheatBunkerPackageBehaviorSearchAutocompletions Auto Const Mandatory
CheatBunker:TransitScript Property CheatBunkerTransitQuest Auto Const Mandatory
Jiffy:Vault111ExitDetector Property CheatBunkerVault111ExitDetector Auto Const Mandatory

CheatBunker:Dependencies:General Function getInstance() Global
	return Game.GetFormFromFile(0x000029A8, CheatBunker:Dependencies.getPluginFilename()) as CheatBunker:Dependencies:General
EndFunction

InjectTec:Injector:Bulk:ChronicleBehavior:Search Function getInjectionSearcher()
	return CheatBunkerPackageBehaviorSearchInjections
EndFunction

InjectTec:Integrator:ChronicleBehavior:Search Function getImporterSearcher()
	return CheatBunkerPackageBehaviorSearchImporters
EndFunction

CheatBunker:Setting:PackageBehavior:Search Function getSettingSearcher()
    return CheatBunkerPackageBehaviorSearchSettings
EndFunction

CheatBunker:Autocompletion:PackageBehavior:Search Function getAutocompletionSearcher()
	return CheatBunkerPackageBehaviorSearchAutocompletions
EndFunction

Jiffy:Vault111ExitDetector Function getVault111ExitDetector()
	return CheatBunkerVault111ExitDetector
EndFunction

CheatBunker:TransitScript Function getTransitQuest()
    return CheatBunkerTransitQuest
EndFunction

CheatBunker:CustomPackageData Function getPackageData(Chronicle:Package targetPackage) Global
	if (!targetPackage)
		return None
	endif
	
	return targetPackage.getCustomData() as CheatBunker:CustomPackageData
EndFunction
