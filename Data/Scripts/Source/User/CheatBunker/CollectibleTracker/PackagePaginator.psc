Scriptname CheatBunker:CollectibleTracker:PackagePaginator extends DynamicTerminal:Paginator:Nested:Dynamic:FormList Conditional

DynamicTerminal:ListWrapper Function getListWrapper(Int iItemID)
	if (!NextPaginator)
		CheatBunker:Logger.log(self + " has a major problem because NextPaginator really is " + NextPaginator)
	endif

	CheatBunker:CollectibleTracker:PackageBehavior trackerBehavior = CheatBunker:Dependencies:General.getInstance().getTrackerSearcher().searchOneTracker(getItem(iItemID) as Chronicle:Package)
	if (trackerBehavior)
		DynamicFormListWrapper.setData(trackerBehavior.getTrackers())
	else
		DynamicFormListWrapper.setData(None)
	endif
	
	return DynamicFormListWrapper
EndFunction
