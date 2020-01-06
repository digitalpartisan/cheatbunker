Scriptname CheatBunker:Dependencies Hidden Const

String Function getPluginFilename() Global
	String sMasterFile = "CheatBunker.esm"
	String sDevFile = "CheatBunker.esp"
	
	if (!Game.IsPluginInstalled(sMasterFile))
		return sDevFile
	endif
	
	return sMasterFile
EndFunction
