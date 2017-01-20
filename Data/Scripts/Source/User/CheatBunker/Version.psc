Scriptname CheatBunker:Version extends Quest Conditional
{Used for tracking version information and easily comparing versions in order to see what changes (if any) need to be made across the Cheat Bunker mod.}

Function logError(String sMessage)
	Debug.TraceStack("[CheatBunker][Version] " + sMessage)
EndFunction

Int Function getMajor()
	logError("getMajor() not impelemented in " + self)
	return 0
EndFunction

Function setMajor(Int iValue)
	logError("setMajor() not impelemented in " + self)
EndFunction

Int Function getMinor()
	logError("getMinor() not impelemented in " + self)
	return 0
EndFunction

Function setMinor(Int iValue)
	logError("setMinor() not impelemented in " + self)
EndFunction

Int Function getBugfix()
	logError("getBugfix() not impelemented in " + self)
	return 0
EndFunction

Function setBugfix(Int iValue)
	logError("setBugfix() not impelemented in " + self)
EndFunction

Bool Function validate()
	return ( getMajor() > 0 || getMinor() > 0 || getBugfix() > 0 ) ; allows for versions that could be 0.0.*, 0.*.0, and *.0.0 - bascially, something needs to not be zero
EndFunction

Int Function compareInt(Int iLeft, Int iRight)
	if (iLeft < iRight)
		return -1
	elseif (iLeft > iRight)
		return 1
	else
		return 0
	endif
EndFunction

Int Function compareMajor(Int iValue)
	return compareInt(getMajor(), iValue)
EndFunction

Int Function compareMinor(Int iValue)
	return compareInt(getMinor(), iValue)
EndFunction

Int Function compareBugfix(Int iValue)
	return compareInt(getBugfix(), iValue)
EndFunction

Int Function compare(CheatBunker:Version otherVersion)
	Int iMajorCompare = compareMajor(otherVersion.getMajor())
	if (0 != iMajorCompare)
		return iMajorCompare
	endif

	Int iMinorCompare = compareMinor(otherVersion.getMinor())
	if (0 != iMinorCompare)
		return iMinorCompare
	endif

	return compareBugfix(otherVersion.getBugfix())
EndFunction

Bool Function equals(CheatBunker:Version otherVersion)
	return compare(otherVersion) == 0
EndFunction

Bool Function lessThan(CheatBunker:Version otherVersion)
	return compare(otherVersion) == -1
EndFunction

Bool Function greaterThan(CheatBunker:Version otherVersion)
	return compare(otherVersion) == 1
EndFunction

Bool Function setTo(CheatBunker:Version otherVersion)
	if (!otherVersion.validate())
		logError("[CheatBunker][Version] " + self + " cannot set value to other version because it fails validation " + otherVersion)
		return false
	endif

	if (otherVersion.lessThan(self))
		logError("[CheatBunker][Version] " + self + " cannot set value to other version because it would be a downgrade " + otherVersion)
		return false
	endif

	setMajor(otherVersion.getMajor())
	setMinor(otherVersion.getMinor())
	setBugfix(otherVersion.getBugfix())

	return true
EndFunction

String Function toString()
	return "v" + getMajor() + "." + getMinor() + "." + getBugfix()
EndFunction
