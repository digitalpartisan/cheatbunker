Scriptname CheatBunker:Logger:Package Hidden Const DebugOnly

String[] Function getTags() Global
	String[] tags = new String[1]
	tags[0] = "Package"
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

Bool Function internalVersionError(CheatBunker:Package myPackage) Global
	return error(myPackage + " stored version greater than display version")
EndFunction

Bool Function notRunningUpdate(CheatBunker:Package myPackage, CheatBunker:PackageUpdater myUpdater) Global
	return log(myPackage.toString() + " decided not to run update " + myUpdater.toString())
EndFunction

Bool Function updateDetected(CheatBunker:Package myPackage) Global
	return log(myPackage.toString() + " detected update to " + myPackage.DisplayVersion.VersionData.toString())
EndFunction

Bool Function uninstall(CheatBunker:Package myPackage) Global
	return log(myPackage + " processing uninstall")
EndFunction

Bool Function nothingToProxy() Global
	return error("proxy has not set a package")
EndFunction

Bool Function noUpdateBehavior(CheatBunker:PackageUpdater myUpdater) Global
	return warn(myUpdater.toString() + " has no update behavior.  This may be deliberate.")
EndFunction

Bool Function runningUpdate(CheatBunker:PackageUpdater myUpdater) Global
	return log(myUpdater.tostring() + " running")
EndFunction

Bool Function updateFromVersionUnset(CheatBunker:PackageUpdater myUpdater) Global
	return error(myUpdater.toString() + " has no from version")
EndFunction

Bool Function updateFromVersionInvalid(CheatBunker:PackageUpdater myUpdater) Global
	return error(myUpdater.toString() + " has an invalid from version")
EndFunction

Bool Function updateToVersionUnset(CheatBunker:PackageUpdater myUpdater) Global
	return error(myUpdater.toString() + " has no to version")
EndFunction

Bool Function updateToVersionInvalid(CheatBunker:PackageUpdater myUpdater) Global
	return error(myUpdater.toString() + " has an invalid to version")
EndFunction
