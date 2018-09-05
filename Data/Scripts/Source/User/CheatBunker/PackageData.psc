Scriptname CheatBunker:PackageData extends Chronicle:Package:CustomData

CheatBunker:PackageCustomizations Property Customizations = None Auto Const
Chronicle:Package:CustomBehavior:Injections Property Injections = None Auto Const

FormList Function getAutocompletions()
	if (!Customizations)
		return None
	endif
	
	return Customizations.Autocompletions
EndFunction

FormList Function getImporters()
	if (!Customizations)
		return None
	endif
	
	return Customizations.Importers
EndFunction

Chronicle:Package:CustomBehavior:Injections Function getInjections()
	return Injections
EndFunction
