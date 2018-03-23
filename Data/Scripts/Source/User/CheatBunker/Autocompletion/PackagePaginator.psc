Scriptname cheatbunker:autocompletion:PackagePaginator extends dynamicterminal:paginator

DynamicTerminal:PaginationProxy Property PaginationProxy Auto Const Mandatory
CheatBunker:Autocompletion:Paginator Property AutocompletionPaginator Auto Const Mandatory
CheatBunker:Autocompletion:ValidList Property AutocompletionList Auto Const Mandatory

Function itemActivation(Int iItem, ObjectReference akTerminalRef)
	AutocompletionList.setData( (getItem(iItem) as CheatBunker:Package).Autocompletions )
	PaginationProxy.init(akTerminalRef, AutocompletionPaginator, AutocompletionList)
EndFunction

Function tokenReplacementLogic()
{Overridden here to use different token names so that autocompletion forms don't replace the package forms as the user backs out of the autocompletion selection terminal.}
	Int iCounter = 0
	Int iPageItems = getPageItems()
	while (iCounter < iPageItems)
		replace("Package" + iCounter, getItem(iCounter))
		iCounter += 1
	endwhile
EndFunction