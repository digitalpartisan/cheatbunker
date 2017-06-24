Scriptname CheatBunker:WorkshopNPCLogic:Synth extends CheatBunker:WorkshopNPCLogic:Settler
{This script is named how it is because the Creation Kit's new script window doesn't allow for very long namespace values (and the renaming window does an equally bad job.}

Function postSpawnBehavior(Actor actorRef)
	(actorRef as WorkshopNPCScript).SetSynth(true)
EndFunction
