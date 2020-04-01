Scriptname CheatBunker:Dependencies Hidden Const

String Function getPluginFilename() Global
	String[] plugins = new String[2]
	plugins[0] = "CheatBunker.esm"
	plugins[1] = "CheatBunker.esp"

	return Jiffy:Utility:Plugin.getFirstInstalledPlugin(plugins)
EndFunction
