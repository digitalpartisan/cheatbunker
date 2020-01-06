Scriptname CheatBunker:Logger:RemoteLoading Hidden Const DebugOnly

String[] Function getTags() Global
	String[] tags = new String[1]
	tags[0] = "Remote Loading"
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

Bool Function logFunctionalityNotImplemented(ScriptObject theObject, String sTheMethod) Global
	return error("Functionality " + sTheMethod + " not implemented on object " + theObject)
EndFunction
