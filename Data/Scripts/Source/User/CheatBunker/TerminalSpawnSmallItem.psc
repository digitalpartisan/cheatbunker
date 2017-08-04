Scriptname CheatBunker:TerminalSpawnSmallItem extends dynamicterminal:paginator Conditional

Message Property mSpawned Auto Const
CheatBunker:QuestScript Property CheatBunkerQuest Auto Const

Function itemActivation(Int iItem, ObjectReference akTerminalRef)
	(getItem(iItem) as CheatBunker:ItemGenerator:Abstract).generate(CheatBunkerQuest.SpawnItemsContainer)
	mSpawned.Show()
EndFunction
