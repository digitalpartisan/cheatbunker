Scriptname CheatBunker:QuestControl:DigitalInput:QuestID extends CheatBunker:QuestControl:DigitalInput

Import InjectTec:Utility:HexidecimalLogic

Int Function getValue()
	CheatBunker:QuestControl:InputValue[] myValues = getValues()
	DigitSet digits = new DigitSet
	digits.sFive = myValues[0].Character
	digits.sFour = myValues[1].Character
	digits.sThree = myValues[2].Character
	digits.sTwo = myValues[3].Character
	digits.sOne = myValues[4].Character
	digits.sZero = myValues[5].Character
	
	return getDigitSetValue(digits)
EndFunction
