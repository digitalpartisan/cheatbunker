Scriptname CheatBunker:Autocompletion:PackagePaginator extends DynamicTerminal:Paginator:Nested:DynamicList Conditional

DynamicTerminal:ListWrapper Function getListWrapper(Int iItemID)
	DynamicListWrapper.setData( (getItem(iItemID) as CheatBunker:Package).Autocompletions )
	return DynamicListWrapper
EndFunction
