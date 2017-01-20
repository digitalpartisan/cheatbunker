Scriptname CheatBunker:Version:Static extends CheatBunker:Version Conditional

Group Values
	Int Property Major = 0 Auto Const
	Int Property Minor = 0 Auto Const
	Int Property Bugfix = 0 Auto Const
EndGroup

Int Function getMajor()
	return Major
EndFunction

Int Function getMinor()
	return Minor
EndFunction

Int Function getBugfix()
	return Bugfix
EndFunction
