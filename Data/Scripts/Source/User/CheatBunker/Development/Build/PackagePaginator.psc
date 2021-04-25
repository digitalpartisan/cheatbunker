Scriptname CheatBunker:Development:Build:PackagePaginator extends DynamicTerminal:Paginator:Nested:Dynamic:FormList Conditional

DynamicTerminal:ListWrapper Function getListWrapper(Int iItemID)
	CheatBunker:Development:Build:PackageBehavior buildBehavior = CheatBunker:Dependencies:General.getInstance().getBuildSearcher().searchOneBuild(getItem(iItemID) as Chronicle:Package)
	if (buildBehavior)
		DynamicFormListWrapper.setData(buildBehavior.getBuilds())
	else
		DynamicFormListWrapper.setData(None)
	endif
	
	return DynamicFormListWrapper
EndFunction
