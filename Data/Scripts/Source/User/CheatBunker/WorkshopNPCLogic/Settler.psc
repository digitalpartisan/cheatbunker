Scriptname CheatBunker:WorkshopNPCLogic:Settler extends CheatBunker:WorkshopNPCLogic

ActorBase Function getBaseActor()
	WorkshopScript workshopRef = getWorkshopRef()
	
	if (workshopRef.CustomWorkshopNPC)
		return workshopRef.CustomWorkshopNPC
	else
		return WorkshopParent.WorkshopNPC
	endif
EndFunction

Function postSettlementBehavior(Actor actorRef)
	WorkshopParent.TryToAutoAssignActor(getWorkshopRef(), actorRef as WorkshopNPCScript)
EndFunction
