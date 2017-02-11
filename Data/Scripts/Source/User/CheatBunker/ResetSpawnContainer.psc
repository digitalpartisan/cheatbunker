Scriptname CheatBunker:ResetSpawnContainer extends ObjectReference Const

CheatBunker:QuestScript Property CheatBunkerQuest Auto Const Mandatory

Event OnActivate(ObjectReference akActionRef)
	CheatBunkerQuest.SpawnItemsContainer.Reset()
EndEvent
