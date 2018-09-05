Scriptname CheatBunker:Autocompletion:PackagePaginator extends DynamicTerminal:Paginator:Nested:DynamicList Conditional

DynamicTerminal:ListWrapper Function getListWrapper(Int iItemID)
	DynamicListWrapper.setData( ((getItem(iItemID) as Chronicle:Package).getCustomData() as CheatBunker:PackageData).getAutocompletions() )
	return DynamicListWrapper
EndFunction
