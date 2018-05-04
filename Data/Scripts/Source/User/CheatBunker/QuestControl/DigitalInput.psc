Scriptname CheatBunker:QuestControl:DigitalInput extends Quest Hidden

Int Property NumberOfDigits = 0 Auto Const Mandatory

CheatBunker:QuestControl:InputValue[] values = None

Function initialize()
	values = new CheatBunker:QuestControl:InputValue[0]
EndFunction

Bool Function isFull()
	return (NumberOfDigits == values.Length)
EndFunction

CheatBunker:QuestControl:InputValue[] Function getValues()
	return values
EndFunction

Int Function getValue()
	CheatBunker:Logger.logBehaviorUndefined(self, "setNextField()")
	return 0
EndFunction

Function setNextField(CheatBunker:QuestControl:InputValue newInput)
	values.Add(newInput)
EndFunction
