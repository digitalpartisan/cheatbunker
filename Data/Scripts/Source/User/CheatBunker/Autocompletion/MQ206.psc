Scriptname cheatbunker:autocompletion:MQ206 extends cheatbunker:autocompletion

ObjectiveComponent[] Property SpecialComponentData Auto Const Mandatory

Struct ObjectiveComponent
	Int ObjectiveID
	MiscObject SpecialComponent
EndStruct

Function executeBehavior()
	Quest targetQuest = getQuest()
	Actor aPlayer = Game.GetPlayer()
	ObjectiveComponent dataSet = None
	Int iCounter = 0
	while (iCounter < SpecialComponentData.Length)
		dataSet = SpecialComponentData[iCounter]
		if (targetQuest.IsObjectiveDisplayed(dataSet.ObjectiveID))
			aPlayer.AddItem(dataSet.SpecialComponent)
		endif
		iCounter += 1
	endWhile
	
	conclude()
EndFunction
