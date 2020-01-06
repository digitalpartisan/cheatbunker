Scriptname CheatBunker:Setting:PackageBehavior extends Chronicle:Package:CustomBehavior

FormList Property MySettings Auto Const Mandatory

FormList Function getSettings()
	return MySettings
EndFunction

Bool Function uninstallBehavior()
	CheatBunker:Setting.stopList(getSettings())
	return true
EndFunction
