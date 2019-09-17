Scriptname CheatBunker:SpawnFormList extends Quest

FormList Property flItems Auto Const
Message Property mSpawned Auto Const

Function spawn()
	Int iCounter = 0
	Int iSize = flItems.GetSize()
	
	While (iCounter < iSize)
		CheatBunker:Dependencies:Spawning.getInstance().getContainerReference().addItem(flItems.GetAt(iCounter))
		iCounter += 1
	EndWhile
	
	mSpawned.Show()
EndFunction
