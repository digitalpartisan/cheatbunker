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
		return
	endif

	CheatBunker:Autocompletion thisAutocompletion = getAutocompletion()

	bCanRun = thisAutocompletion.canRun()
	bRunning = thisAutocompletion.isRunning()
	bCanHalt = thisAutocompletion.canHalt()
	bFinished = thisAutocompletion.isFinished()
EndFunction

Function setAutocompletion(CheatBunker:Autocompletion newValue)
	myAutocompletion = newValue
	updateConditionals()
EndFunction

Function tokenReplacementLogic()
	if (!setCheck())
		return
	endif
	
	updateConditionals()

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
	if (!thisAutocompletion.canRun())
		return
	endif

	thisAutocompletion.run()
	updateConditionals()
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
	updateConditionals()
	draw(akTerminalRef)
EndFunction
