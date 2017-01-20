Scriptname CheatBunker:Version:Stored extends CheatBunker:Version Conditional

Int iMajorVersion = 0 Conditional
Int iMinorVersion = 0 Conditional
Int iBugfixVersion = 0 Conditional

Int Function getMajor()
	return iMajorVersion
EndFunction

Function setMajor(Int iValue)
	iMajorVersion = iValue
EndFunction

Int Function getMinor()
	return iMinorVersion
EndFunction

Function setMinor(Int iValue)
	iMinorVersion = iValue
EndFunction

Int Function getBugfix()
	return iBugfixVersion
EndFunction

Function setBugfix(Int iValue)
	iBugfixVersion = iValue
EndFunction

Function invalidate()
{Useful for indicating that something was uninstalled.}
	setMajor(0)
	setMinor(0)
	setBugfix(0)
EndFunction
