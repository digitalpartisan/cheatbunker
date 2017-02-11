Scriptname CheatBunker:ResetWorkshopContainer extends ObjectReference Const

CheatBunker:QuestScript Property CheatBunkerQuest Auto Const Mandatory
LeveledItem Property CheatBunkerCLLScrap Auto Const Mandatory

Event OnActivate(ObjectReference akActionRef)
	ObjectReference workshop = CheatBunkerQuest.Workshop
	workshop.RemoveAllItems()
	workshop.AddItem(CheatBunkerCLLScrap)
EndEvent
