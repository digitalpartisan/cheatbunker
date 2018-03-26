Scriptname CheatBunker:Autocompletion:Proxy extends DynamicTerminal:Basic Conditional

Bool bCanRun = false Conditional
Bool bRunning = false Conditional
Bool bCanHalt = false Conditional
Bool bFinished = false Conditional

CheatBunker:Autocompletion myAutocompletion = None

Group Messaging
	Message Property CannotRun Auto Const
	Message Property NotRunning Auto Const
	Message Property Running Auto Const
	Message Property Finished Auto Const
	Message Property DefaultSpecialInstructions Auto Const
EndGroup

CheatBunker:Autocompletion Function getAutocompletion()
	return myAutocompletion
EndFunction

Bool Function setCheck()
	if (None == getAutocompletion())
		CheatBunker:Logger:Autocompletion.nothingToProxy()
		return false
	endif

	return true
EndFunction

Function updateConditionals()
	if (!setCheck())
		bCanRun = false
		bRunning = false
		bCanHalt = false
		bFinished = false
		
		return
	endif

	CheatBunker:Autocompletion thisAutocompletion = getAutocompletion()

	bCanRun = thisAutocompletion.canExecute()
	bRunning = thisAutocompletion.isExecuting()
	bCanHalt = thisAutocompletion.canHalt()
	bFinished = thisAutocompletion.isConcluded()
EndFunction

Function setAutocompletion(CheatBunker:Autocompletion newValue)
	myAutocompletion = newValue
EndFunction

Function tokenReplacementLogic()
	if (!setCheck())
		return
	endif
	
	updateConditionals()

	CheatBunker:Logger:Autocompletion.logProxyState(self, bCanRun, bRunning, bCanHalt, bFinished)
	
	CheatBunker:Autocompletion thisAutocompletion = getAutocompletion()
	replace("AutocompletionObject", thisAutocompletion)
	replace("Description", thisAutocompletion.Description)
	replace("FinishedStatus", Finished)
	replace("RunningStatus", Running)
	replace("NotRunningStatus", NotRunning)
	replace("CannotRunStatus", CannotRun)
	replace("RunConditions", thisAutocompletion.RunConditions)
	if (thisAutocompletion.SpecialInstructions == None)
		replace("SpecialInstructions", DefaultSpecialInstructions)
	else
		replace("SpecialInstructions", thisAutocompletion.SpecialInstructions)
	endif
EndFunction

Function run(ObjectReference akTerminalRef)
	if (!setCheck())
		return
	endif
	
	CheatBunker:Autocompletion thisAutocompletion = getAutocompletion()
	if (!thisAutocompletion.canExecute())
		return
	endif

	thisAutocompletion.execute()
	draw(akTerminalRef)
EndFunction

Function halt(ObjectReference akTerminalRef)
	if (!setCheck())
		return
	endif

	CheatBunker:Autocompletion thisAutocompletion = getAutocompletion()
	if (!thisAutocompletion.canHalt())
		return
	endif

	thisAutocompletion.halt()
	draw(akTerminalRef)
EndFunction
