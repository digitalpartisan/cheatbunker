Scriptname CheatBunker:SpawnFormList extends Quest

CheatBunker:QuestScript Property CheatBunkerQuest Auto Const
FormList Property flItems Auto Const
Message Property mSpawned Auto Const
Bool Property bInContainer = false Auto Const

Function spawn()
	Int iCounter = 0
	Int iSize = flItems.GetSize()
	While (iCounter < iSize)
		Form fItem = flItems.GetAt(iCounter)
		if (bInContainer)
			ObjectReference oReference = CheatBunkerQuest.SpawnItemsContainer.PlaceAtMe(fItem)
			CheatBunkerQuest.SpawnItemsContainer.addItem(oReference)
		else
			CheatBunkerQuest.SpawnItemsMarker.PlaceAtMe(fItem)
		endif
		iCounter += 1
	EndWhile
	mSpawned.Show()
EndFunction
