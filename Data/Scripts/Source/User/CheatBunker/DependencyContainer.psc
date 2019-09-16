Scriptname CheatBunker:DependencyContainer extends Jiffy:ValueMap

InjectTec:Injector:Bulk:ChronicleBehavior:Search Property CheatBunkerPackageBehaviorSearchInjections Auto Const Mandatory
CheatBunker:Importer:PackageBehavior:Search Property CheatBunkerPackageBehaviorSearchImporters Auto Const Mandatory
CheatBunker:Autocompletion:PackageBehavior:Search Property CheatBunkerPackageBehaviorSearchAutocompletions Auto Const Mandatory

String sTokenSearchInjections = "SearchInjections" Const
String sTokenSearchImporters = "SearchImporters" Const
String sTokenSearchAutocompletions = "SearchAutocompletions" Const

CheatBunker:DependencyContainer Function getInstance() Global
	String sMasterFile = "CheatBunker.esm"
	String sDevFile = "CheatBunker.esp"
	
	String sPluginFile = sMasterFile
	if (!Game.IsPluginInstalled(sPluginFile))
		sPluginFile = sDevFile
	endif
	
	return Game.GetFormFromFile(0x0000781A, sPluginFile) as CheatBunker:DependencyContainer
EndFunction

InjectTec:Injector:Bulk:ChronicleBehavior:Search Function getSearchInjections()
	return get(sTokenSearchInjections) as InjectTec:Injector:Bulk:ChronicleBehavior:Search
EndFunction

CheatBunker:Importer:PackageBehavior:Search Function getSearchImporters()
	return get(sTokenSearchImporters) as CheatBunker:Importer:PackageBehavior:Search
EndFunction

CheatBunker:Autocompletion:PackageBehavior:Search Function getSearchAutocompletions()
	return get(sTokenSearchAutocompletions) as CheatBunker:Autocompletion:PackageBehavior:Search
EndFunction

Function initialize()
	set(sTokenSearchInjections, CheatBunkerPackageBehaviorSearchInjections)
	set(sTokenSearchImporters, CheatBunkerPackageBehaviorSearchImporters)
	set(sTokenSearchAutocompletions, CheatBunkerPackageBehaviorSearchAutocompletions)
EndFunction
