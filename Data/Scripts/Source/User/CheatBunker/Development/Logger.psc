Scriptname CheatBunker:Development:Logger Hidden Const DebugOnly

String[] Function getTags() Global
	String[] tags = new String[1]
	tags[0] = "Build"
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

bool function applyingBuild(CheatBunker:Development:Build buildObject) global
	return log("Applying build object " + buildObject)
endfunction

bool function doneApplyingBuild(CheatBunker:Development:Build buildObject) global
	return log("Done applying build object " + buildObject)
endfunction

bool function incrementingExpectedLevel(int value) global
	return log("Incremented expected level to " + value)
endfunction

bool function advancingLevel(int value) global
	return log("Advancing level to " + value)
endfunction

bool function incrementingExpectedAttributeValue(ActorValue attribute, int level, bool bNoLevel) global
	String sMessage = "Incrementing expected " + attribute + " value to " + level
	if (bNoLevel)
		sMessage += " for free"
	endif

	return log(sMessage)
endfunction

bool function augmentingAttributeValue(ActorValue attribute, int level) global
	return log("Augmenting " + attribute + " value to " + level)
endfunction

bool function enforcingStartingStats(CheatBunker:Development:Utility:StartingStats settings) global
	return log("Enforcing starting SPECIAL stats of " + settings)
endfunction

bool function applyingBobbleheads() global
	return log("Applying Bobbleheads to SPECIAL stats")
endfunction

bool function enforcingStep(CheatBunker:Development:Utility:Step settings) global
	return log("Enforcing step " + settings)
endfunction
