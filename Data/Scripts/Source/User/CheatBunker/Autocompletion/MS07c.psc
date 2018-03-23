Scriptname CheatBunker:Autocompletion:MS07c extends CheatBunker:Autocompletion

Struct StageTapeAssociation
	ReferenceAlias TapeRef
	Int StageID
EndStruct

StageTapeAssociation[] Property TapeStages Auto Const Mandatory

Function completeTapeStage(StageTapeAssociation tapeStageData)
	Quest targetQuest = getQuest()
	if (!targetQuest.IsStageDone(tapeStageData.StageID))
		Game.GetPlayer().AddItem(tapeStageData.TapeRef.GetReference())
	endif
EndFunction

Function executeBehavior()
	Int iCounter = 0
	while (iCounter < TapeStages.Length)
		completeTapeStage(TapeStages[iCounter])
		iCounter += 1
	endWhile
	
	conclude()
EndFunction
