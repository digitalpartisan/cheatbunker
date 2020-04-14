Scriptname CheatBunker:QuestControl:DigitalInput:Terminal:Proxy extends Quest Conditional

Bool bAcceptingHexidecimalInput = false Conditional
CheatBunker:QuestControl:DigitalInput:Terminal terminalLogic = None

Function proxyTerminalLogic(CheatBunker:QuestControl:DigitalInput:Terminal newValue)
	bAcceptingHexidecimalInput = false
	terminalLogic = newValue
	if (terminalLogic)
		bAcceptingHexidecimalInput = terminalLogic.isAcceptingHexidecimalInput()
	endif
EndFunction

Function newInput(CheatBunker:QuestControl:InputValue newValue, ObjectReference akTerminalRef)
	terminalLogic && terminalLogic.newInput(newvalue, akTerminalRef)
EndFunction
