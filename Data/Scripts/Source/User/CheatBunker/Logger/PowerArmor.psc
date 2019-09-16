Scriptname CheatBunker:Logger:PowerArmor Hidden Const DebugOnly

String[] Function getTags() Global
	String[] tags = new String[1]
	tags[0] = "PowerArmor"
	return tags
EndFunction

Bool Function log(String sMessage) Global
	return Jiffy:Loggout.log(CheatBunker:Logger.getName(), sMessage, getTags())
EndFunction

Bool Function warn(String sMessage) Global
	return Jiffy:Loggout.warn(CheatBunker:Logger.getName(), sMessage, getTags())
EndFunction

Bool Function error(String sMessage) Global
	return Jiffy:Loggout.error(CheatBunker:Logger.getName(), sMessage, getTags())
EndFunction

Bool Function logPreSpawnSearchResults(ObjectReference[] akResults) Global
	String sMessage = "Found " + akResults.Length + " power armor frames: "
	
	Int iCounter = 0
	while (iCounter < akResults.Length)
		sMessage += " " + akResults[iCounter]
		iCounter += 1
	endWhile
	
	return log(sMessage)
EndFunction
