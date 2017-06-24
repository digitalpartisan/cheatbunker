Scriptname CheatBunker:Logger Hidden Const DebugOnly

String Function getName() Global
	return "CheatBunker"
EndFunction

Bool Function log(String sMessage) Global
	return Loggout.log(getName(), sMessage)
EndFunction

Bool Function warn(String sMessage) Global
	return Loggout.warn(getName(), sMessage)
EndFunction

Bool Function error(String sMessage) Global
	return Loggout.error(getName(), sMessage)
EndFunction

Bool Function stoppingQuest(Quest myQuest) Global
	return log(myQuest + " is stopping")
EndFunction

Bool Function containerReset(ObjectReference akContainer) Global
	return log(akContainer + " has been reset")
EndFunction

Bool Function missingPackage() Global
	return error("missing package detected")
EndFunction

Bool Function uninstall() Global
	return log("uninstall initiated")
EndFunction

Bool Function preloadingCell() Global
	return log("preloading interior")
EndFunction

Bool Function logBehaviorUndefined(ScriptObject script, String sName) Global
	return warn("Behavior " + sName + " undefined on " + script)
EndFunction
