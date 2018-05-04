Scriptname CheatBunker:QuestControl:DigitalInput:StageID extends CheatBunker:QuestControl:DigitalInput

Int Function getValue()
	CheatBunker:QuestControl:InputValue[] myValues = getValues()
	Int iValue = 0
	Int iCounter = 0
	
	while (iCounter < myValues.Length)
		iValue += (Math.pow(10, (myValues.Length - 1 - iCounter)) * InjectTec:HexidecimalLogic.getCharacterValue(myValues[iCounter].Character)) as Int
		iCounter += 1
	endWhile
	
	return iValue
EndFunction
