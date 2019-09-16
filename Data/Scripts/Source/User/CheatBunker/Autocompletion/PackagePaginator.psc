Scriptname CheatBunker:Autocompletion:PackagePaginator extends DynamicTerminal:Paginator:Nested:Dynamic:FormList Conditional

CheatBunker:Autocompletion:PackageBehavior:Search Property CheatBunkerPackageBehaviorSearchAutocompletions Auto Const Mandatory

DynamicTerminal:ListWrapper Function getListWrapper(Int iItemID)
	CheatBunker:Autocompletion:PackageBehavior autocompletionBehavior = CheatBunkerPackageBehaviorSearchAutocompletions.searchOneAutocompletion(getItem(iItemID) as Chronicle:Package)
	if (autocompletionBehavior)
		DynamicFormListWrapper.setData(autocompletionBehavior.getAutocompletions())
	else
		DynamicFormListWrapper.setData(None)
	endif
	
	return DynamicFormListWrapper
EndFunction
