Scriptname CheatBunker:WorkshopNPCLogic:Guard extends CheatBunker:WorkshopNPCLogic:Settler
{This script is named how it is because the Creation Kit's new script window doesn't allow for very long namespace values (and the renaming window does an equally bad job.}

ActorBase Function getBaseActor()
	return WorkshopParent.WorkshopNPCGuard
EndFunction
