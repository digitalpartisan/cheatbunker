Scriptname CheatBunker:Autocompletion:PackagePaginator extends DynamicTerminal:Paginator:Nested:Dynamic:FormList Conditional

DynamicTerminal:ListWrapper Function getListWrapper(Int iItemID)
	CheatBunker:Autocompletion:PackageBehavior autocompletionBehavior = CheatBunker:Dependencies:General.getInstance().getAutocompletionSearcher().searchOneAutocompletion(getItem(iItemID) as Chronicle:Package)
	if (autocompletionBehavior)
		DynamicFormListWrapper.setData(autocompletionBehavior.getAutocompletions())
	else
		DynamicFormListWrapper.setData(None)
	endif
	
	return DynamicFormListWrapper
EndFunction
