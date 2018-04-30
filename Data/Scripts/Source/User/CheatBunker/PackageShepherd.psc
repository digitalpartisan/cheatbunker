Scriptname CheatBunker:PackageShepherd extends Chronicle:Package:Shepherd

Function attemptInstallation()
	Chronicle:Package:NonCore packageRef = getPackage()

	if (packageRef.IsRunning())
		CheatBunker:Logger.logRetrofittingPackage(packageRef)
		packageRef.Stop() ; stopping a legacy package means it can install properly
	endif
	
	parent.attemptInstallation()
EndFunction
