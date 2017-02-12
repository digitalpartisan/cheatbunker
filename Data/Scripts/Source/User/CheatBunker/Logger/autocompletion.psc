Scriptname CheatBunker:Logger:Autocompletion Hidden Const DebugOnly

String[] Function getTags() Global
	String[] tags = new String[1]
	tags[0] = "Autocompletion"
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

Bool Function running(CheatBunker:Autocompletion myAutoCompleter) Global
	return log(myAutoCompleter + " running")
EndFunction

Bool Function listening(CheatBunker:Autocompletion myAutoCompleter) Global
	return log(myAutoCompleter + " listening")
EndFunction

Bool Function notListening(CheatBunker:Autocompletion myAutoCompleter) Global
	return log(myAutoCompleter + " not listening")
EndFunction

Bool Function halting(CheatBunker:Autocompletion myAutoCompleter) Global
	return log(myAutoCompleter + " halting")
EndFunction

Bool Function finished(CheatBunker:Autocompletion myAutoCompleter) Global
	return log(myAutoCompleter + " finished")
EndFunction

Bool Function available(CheatBunker:Autocompletion myAutoCompleter) Global
	return log(myAutoCompleter + " available")
EndFunction

Bool Function nothingToProxy() Global
	return error("proxy script has not set an autocompleter")
EndFunction
