Scriptname CheatBunker:Autocompletion:PackagePaginator extends DynamicTerminal:Paginator:Nested:DynamicList Conditional

DynamicTerminal:ListWrapper Function getListWrapper(Int iItemID)
	DynamicListWrapper.setData( ((getItem(iItemID) as Chronicle:Package).getCustomizations() as CheatBunker:PackageCustomizations).Autocompletions )
	return DynamicListWrapper
EndFunction
