Scriptname CheatBunker:Logger:Settings Hidden Const DebugOnly

String[] Function getTags() Global
    String[] tags = new String[1]
    tags[0] = "Setting"
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

Bool Function logActivating(CheatBunker:Setting setting) Global
    return log("activating setting " + setting)
EndFunction

Bool Function logDeactivating(CheatBunker:Setting setting) Global
    return log("deactivating setting " + setting)
EndFunction

Bool Function logLoadEvent(CheatBunker:Setting setting) Global
    return log(setting + " observed a game load event")
EndFunction
