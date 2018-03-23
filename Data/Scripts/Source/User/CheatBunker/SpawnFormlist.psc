Scriptname CheatBunker:SpawnFormList extends Quest

CheatBunker:QuestScript Property CheatBunkerQuest Auto Const
FormList Property flItems Auto Const
Message Property mSpawned Auto Const

Function spawn()
	Int iCounter = 0
	Int iSize = flItems.GetSize()
	
	While (iCounter < iSize)
		CheatBunkerQuest.SpawnItemsContainer.addItem(flItems.GetAt(iCounter))
		iCounter += 1
	EndWhile
	
	mSpawned.Show()
EndFunction
