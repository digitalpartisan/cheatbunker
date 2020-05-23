Scriptname CheatBunker:WorldSpace:EntranceButton:Spawner extends Spawny:Spawner:Simple

Spawny:Spawner:AdjustmentHandler Function getAdjuster()
	return CheatBunker:Dependencies:WorldSpaces.getInstance().getAdjuster()
EndFunction
