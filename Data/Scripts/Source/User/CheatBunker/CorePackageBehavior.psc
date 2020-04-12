Scriptname CheatBunker:CorePackageBehavior extends Chronicle:Package:CustomBehavior
{This is a maintenance script that makes the v1.10.0 changes to the fast travel take effect in situations where the upgrade is happening from a version of the Cheat Bunker where Chronicle was not in use.
This also helps in edge cases where the bunker's interior cell ends up with fast travel disabled due to save situations or general bugs.}

Cell Property CheatBunkerInterior Auto Const Mandatory
{Autofill}

Bool Function installBehavior()
	CheatBunkerInterior.EnableFastTravel()
	return true
EndFunction

Bool Function postloadBehavior()
	CheatBunkerInterior.EnableFastTravel()
	return true
EndFunction
