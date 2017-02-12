Scriptname CheatBunker:Logger:importer Hidden Const DebugOnly

String[] Function getTags() Global
	String[] tags = new String[1]
	tags[0] = "Importer"
	return tags
EndFunction

Bool Function log(String sMessage) Global
	return Loggout.log(CheatBunker:Logger.getName(), sMessage, getTags())
EndFunction

Bool Function warn(String sMessage) Global
	return Loggout.warn(CheatBunker:Logger.getName(), sMessage, getTags())
EndFunction

Bool Function error(String sMessage) Global
	return Loggout.error(CheatBunker:Logger.getName(), sMessage, getTags())
EndFunction

Bool Function nothingToProxy() Global
	return error("proxy has not set an importer")
EndFunction
