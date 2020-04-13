Scriptname CheatBunker:Autocompletion:AutofireSetting extends CheatBunker:Setting

Bool Function isSetForPackage(Chronicle:Package targetPackage) Global
	CheatBunker:CustomPackageData targetData = CheatBunker:Dependencies:General.getPackageData(targetPackage)
	return targetData && targetData.autofireAutocompletions()
EndFunction

Function startupLogic()
	Chronicle:Package targetPackage = getPackage()
    CheatBunker:CustomPackageData targetData = CheatBunker:Dependencies:General.getPackageData(targetPackage)
	
	if (targetData)
		targetData.activateAutofireAutocompletions()
		
		CheatBunker:Autocompletion:PackageBehavior autocompletionBehavior = CheatBunker:Dependencies:General.getInstance().getAutocompletionSearcher().searchOneAutocompletion(targetPackage)
		if (!autocompletionBehavior)
			return
		endif
		
		FormList autocompletions = autocompletionBehavior.getAutocompletions()
		Int iSize = autocompletions.GetSize()
		if (!iSize)
			return
		endif
		
		Int iCounter = 0
		CheatBunker:Autocompletion targetOption = None
		while (iCounter < iSize)
			targetOption = autocompletions.GetAt(iCounter) as CheatBunker:Autocompletion
			targetOption && targetOption.availabilityCheck()
			iCounter += 1
		endWhile
	endif
EndFunction

Function shutdownLogic()
    CheatBunker:CustomPackageData targetData = CheatBunker:Dependencies:General.getPackageData(getPackage())
	targetData && targetData.deactivateAutofireAutocompletions()
EndFunction
