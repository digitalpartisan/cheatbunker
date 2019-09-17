Scriptname CheatBunker:Dependencies:General extends Quest Const

InjectTec:Injector:Bulk:ChronicleBehavior:Search Property CheatBunkerPackageBehaviorSearchInjections Auto Const Mandatory
CheatBunker:Importer:PackageBehavior:Search Property CheatBunkerPackageBehaviorSearchImporters Auto Const Mandatory
CheatBunker:Autocompletion:PackageBehavior:Search Property CheatBunkerPackageBehaviorSearchAutocompletions Auto Const Mandatory
Jiffy:Vault111ExitDetector Property CheatBunkerVault111ExitDetector Auto Const Mandatory

String Function getPluginFilename() Global
	String sMasterFile = "CheatBunker.esm"
	String sDevFile = "CheatBunker.esp"
	
	if (!Game.IsPluginInstalled(sMasterFile))
		return sDevFile
	endif
	
	return sMasterFile
EndFunction

CheatBunker:Dependencies:General Function getInstance() Global
	return Game.GetFormFromFile(0x000029A8, getPluginFilename()) as CheatBunker:Dependencies:General
EndFunction

InjectTec:Injector:Bulk:ChronicleBehavior:Search Function getInjectionSearcher()
	return CheatBunkerPackageBehaviorSearchInjections
EndFunction

CheatBunker:Importer:PackageBehavior:Search Function getImporterSearcher()
	return CheatBunkerPackageBehaviorSearchImporters
EndFunction

CheatBunker:Autocompletion:PackageBehavior:Search Function getAutocompletionSearcher()
	return CheatBunkerPackageBehaviorSearchAutocompletions
EndFunction

Jiffy:Vault111ExitDetector Function getVault111ExitDetector()
	return CheatBunkerVault111ExitDetector
EndFunction
