Scriptname CheatBunker:Logger:Companion Hidden Const DebugOnly

String[] Function getTags() Global
	String[] tags = new String[1]
	tags[0] = "Companion"
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

Bool Function nothingToProxy() Global
	return error("proxy has not set a companion to act on")
EndFunction

Bool Function affinity(CheatBunker:Companion myCompanion, Float fAffinity, Float fThreshold) Global
	return log(myCompanion + " affinity: " + fAffinity + " threshold: " + fThreshold)
EndFunction

Bool Function movingToPlayer(Actor aTarget) Global
	return log(aTarget + " moving to player")
EndFunction
