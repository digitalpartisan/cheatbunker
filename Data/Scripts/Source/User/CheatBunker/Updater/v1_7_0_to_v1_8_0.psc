Scriptname CheatBunker:Updater:v1_7_0_to_v1_8_0 extends CheatBunker:PackageUpdater

CheatBunker:Package Property CheatBunkerPackageBase Auto Const Mandatory

Function updateBehavior()
	CheatBunker:Autocompletion.retrofitPackage(CheatBunkerPackageBase)
EndFunction
