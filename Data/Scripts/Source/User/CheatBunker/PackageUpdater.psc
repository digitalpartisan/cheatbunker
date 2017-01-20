Scriptname CheatBunker:PackageUpdater extends Quest Conditional
{Used for patching changes to Cheat Bunker packages that cannot be performed any other way than programmatically (unlike Injection / Importer updates.)
Most likely, these update objects will be used to clean up the effects of bugs which persist after the root causes have been corrected.
Be sure to specify the appropriate version objects or else the update cannot run since its scope will be indeterminate.
Don't forget to add these new behaviors to the package's update FormList so that they are performed when an update occurs at the version equal to the FromVersion property.}

Group Versions
	CheatBunker:Version:Static Property FromVersion Auto Const
	CheatBunker:Version:Static Property ToVersion Auto Const
EndGroup

Function logError(String sMessage)
	Debug.Trace("[CheatBunker][PackageUpdater] " + toString() + " " + sMessage)
EndFunction

Bool Function validate()
{Written in such a way that all possible errors are reported on even if a failure result has already been detected.}
	Bool bCanTest = true

	if (FromVersion == None)
		logError("FromVersion unset")
		bCanTest = false
	else
		if (!FromVersion.validate())
			logError("FromVersion invalid")
			bCanTest = false
		endif
	endif

	if (ToVersion == None)
		logError("ToVersion unset")
		bCanTest = false
	else
		if (!ToVersion.validate())
			logError("ToVersion invalid")
			bCanTest = false
		endif
	endif

	if (!bCanTest)
		return false
	endif

	return (ToVersion.greaterThan(FromVersion))
EndFunction

Function updateBehavior()
{Override this to implement the needed upgrade behavior.}
	Debug.Trace("[CheatBunker][PackageUpdater] " + toString() + " has no update behavior.  This may be deliberate.")
EndFunction

Function run()
	Debug.Trace("[CheatBunker][PackageUpdater] running " + toString())
	updateBehavior()
EndFunction

String Function toString()
	return "updater " + self + " (" + FromVersion.toString() + " to " + ToVersion.toString() + ")"
EndFunction
