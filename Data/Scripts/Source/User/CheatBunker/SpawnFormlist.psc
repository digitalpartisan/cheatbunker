Scriptname CheatBunker:SpawnFormList extends Quest

FormList Property flItems Auto Const
Message Property mSpawned Auto Const

Function spawn()
	CheatBunker:Dependencies:Spawning.getInstance().spawnList(flItems)
	mSpawned.Show()
EndFunction
